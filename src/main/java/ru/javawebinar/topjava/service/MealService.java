package ru.javawebinar.topjava.service;

import org.springframework.stereotype.Service;
import ru.javawebinar.topjava.model.Meal;
import ru.javawebinar.topjava.repository.MealRepository;
import ru.javawebinar.topjava.to.MealTo;
import ru.javawebinar.topjava.util.MealsUtil;
import ru.javawebinar.topjava.web.SecurityUtil;

import java.util.Collection;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import static ru.javawebinar.topjava.util.ValidationUtil.checkNotFoundWithId;

@Service
public class MealService {

    private MealRepository repository;

    public MealService(MealRepository repository) {
        this.repository = repository;
    }

    public MealTo create(Meal meal, int userId) {
        Meal mealCreated = repository.save(meal, userId);
        List<MealTo> mealToList = MealsUtil.getTos(repository.getAll(userId), SecurityUtil.authUserCaloriesPerDay());
        return mealToList.stream().filter(mealTo -> mealTo.getId() == mealCreated.getId()).findFirst().get();
    }

    public void delete(int id, int userId) {
        checkNotFoundWithId(repository.delete(id, userId), id);
    }

    public MealTo get(int id, int userId) {
        Meal meal = checkNotFoundWithId(repository.get(id, userId), id);
        List<MealTo> mealToList = MealsUtil.getTos(repository.getAll(userId), SecurityUtil.authUserCaloriesPerDay());
        return mealToList.stream().filter(mealTo -> mealTo.getId() == meal.getId()).findFirst().get();
    }

    public Collection<MealTo> getAll(int userId) {
        List<MealTo> mealToList = MealsUtil.getTos(repository.getAll(userId), SecurityUtil.authUserCaloriesPerDay());
        return mealToList.stream().sorted(Comparator.comparing(MealTo::getDateTime).reversed()).collect(Collectors.toList());
    }

    public void update(Meal meal, int userId) {
        checkNotFoundWithId(repository.save(meal, userId), meal.getId());
    }
}