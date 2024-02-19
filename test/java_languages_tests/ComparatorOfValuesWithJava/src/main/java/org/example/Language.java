package org.example;

import pl.allegro.finance.tradukisto.internal.Container;
import pl.allegro.finance.tradukisto.internal.IntegerToStringConverter;
import pl.allegro.finance.tradukisto.internal.LongToStringConverter;

public enum Language {
    BULGARIAN(Container.bulgarianContainer().getIntegerConverter(), Container.bulgarianContainer().getLongConverter()),
    CROATIAN(Container.croatianContainer().getIntegerConverter(), Container.croatianContainer().getLongConverter()),
    CZECH(Container.czechContainer().getIntegerConverter(), Container.czechContainer().getLongConverter()),
    DUTCH(Container.dutchContainer().getIntegerConverter(), Container.dutchContainer().getLongConverter()),
    ENGLISH(Container.englishContainer().getIntegerConverter(), Container.englishContainer().getLongConverter()),
    FRENCH(Container.frenchContainer().getIntegerConverter(), Container.frenchContainer().getLongConverter()),
    GERMAN(Container.germanContainer().getIntegerConverter(), Container.germanContainer().getLongConverter()),
    HINDI(Container.hindiContainer().getIntegerConverter(), Container.hindiContainer().getLongConverter()),
    ITALIAN(Container.italianContainer().getIntegerConverter(), Container.italianContainer().getLongConverter()),
    JAPANESE(Container.japaneseKanjiContainer().getIntegerConverter(), Container.japaneseKanjiContainer().getLongConverter()),
    KAZAKH(Container.kazakhContainer().getIntegerConverter(), null),
    LATVIAN(Container.latvianContainer().getIntegerConverter(), null),
    POLISH(Container.polishContainer().getIntegerConverter(), Container.polishContainer().getLongConverter()),
    PORTUGUESE(Container.brazilianPortugueseContainer().getIntegerConverter(), Container.brazilianPortugueseContainer().getLongConverter()),
    RUSSIAN(Container.russianContainer().getIntegerConverter(), null),
    SERBIAN(Container.serbianContainer().getIntegerConverter(), null),
    SLOVAK(Container.slovakContainer().getIntegerConverter(), Container.slovakContainer().getLongConverter()),
    SLOVENE(Container.sloveneContainer().getIntegerConverter(), Container.sloveneContainer().getLongConverter()),
    SPANISH(Container.spanishContainer().getIntegerConverter(), Container.spanishContainer().getLongConverter()),
    SWEDISH(Container.swedishContainer().getIntegerConverter(), Container.swedishContainer().getLongConverter()),
    TURKISH(Container.turkishContainer().getIntegerConverter(), Container.turkishContainer().getLongConverter()),
    UKRAINIAN(Container.ukrainianContainer().getIntegerConverter(), null);

    private final IntegerToStringConverter integerToStringConverter;
    private final LongToStringConverter longToStringConverter;

    private Language(IntegerToStringConverter integerToStringConverter, LongToStringConverter longToStringConverter) {
        this.integerToStringConverter = integerToStringConverter;
        this.longToStringConverter = longToStringConverter;
    }

    public IntegerToStringConverter getIntegerToStringConverter() {
        return integerToStringConverter;
    }

    public LongToStringConverter getLongToStringConverter() {
        return longToStringConverter;
    }
}
