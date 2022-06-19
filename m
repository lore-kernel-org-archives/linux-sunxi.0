Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806507B
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jun 2022 11:44:37 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id h23so16216457ejj.12
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Jun 2022 04:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FQbBjcBfD7V1TcniNo3XYd/5J9V350QbGnDoj858ycY=;
        b=Xb2iTmdVGW+PvMqYxyub4QxQHV0TQ3b1izCzfoW+XluTzOwzcJfFWuSbZRoAA8lbzD
         v8FNJy0aJolsQjoY545X+w1K24MJJ5xZ1YJcMRSE57UH+wPFznA2G+6mpi7DS/3FlPRd
         FFalUTcBi633WGar9Efv/B9+GqSU1Y7hiwCWUOppYIlzQ0q+41xmysIiOxkknSiCpHUS
         TcZ86uKkqZAwlnnwnxfOIm9jG85icOGl9SiA0lwCsTpyP/KlLoaHvhupschG9uoJflWM
         f2DM8vuegImSXr+iCVartWQDiucYQCQDLz9opYJK4TWDIvyu7T9lB9/C+vOtLHmw2NT0
         PWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FQbBjcBfD7V1TcniNo3XYd/5J9V350QbGnDoj858ycY=;
        b=t6OlXcKVdmTW50fkhQBmEolLUtaX6L8O6jxizod2V5SktbySY4eX29EwszxctpbX6H
         cumqxweXc42fJq5Qn+BhpSJzWElVO25iqBjlIOQejkBsbU0jC8qZ4LzJTqcd48+UqYGG
         OugdbUM2fcBR6a73uU1/Bm2QnHI/0N/tQGI7xuZHl8/g0iwMhjvOvCDJbocjO2KBKDgI
         PQBsi65dhsU9rQ9ogbwVHigHHXDcsKaB7phRMiPm2sFcfj6ZWl/OKyLrHCeKVR/d+qSN
         nT0Ors9O0TWiXy5lI3T1QRAvT8q7Msp2POeSKbrj1FK0V27poFVr0zaDidL/jG7Qa0Zr
         6tWg==
X-Gm-Message-State: AJIora81vI5ZVrylgSbqz5qngm1Y7u3XIXmQJJGe660f6+XppVH+l1jF
	ueYzqh1geE6AjOvYvSpsQ88/y380/cnrsNSxnUk=
X-Google-Smtp-Source: AGRyM1tlqH8/GM63li+9dtAK0sP+225UJsR/jtnTMd09exzoSTHeAoncSqMSOd4NfnVRj4GYFD3MYUvNG3rNbv4f1SY=
X-Received: by 2002:a17:906:d550:b0:704:7ba6:9854 with SMTP id
 cr16-20020a170906d55000b007047ba69854mr16758726ejc.579.1655639075680; Sun, 19
 Jun 2022 04:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220618165747.55709-1-samuel@sholland.org> <20220618165747.55709-3-samuel@sholland.org>
In-Reply-To: <20220618165747.55709-3-samuel@sholland.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 19 Jun 2022 13:43:59 +0200
Message-ID: <CAHp75VcXNTxusT5N_8JvYWMhUyY_sAUzTcT3h0hz2bAawv6ThQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] Input: pinephone-keyboard - Add PinePhone keyboard driver
To: Samuel Holland <samuel@sholland.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input <linux-input@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Ondrej Jirman <x@xff.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, 
	Colin Ian King <colin.king@intel.com>, David Gow <davidgow@google.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marco Felsch <m.felsch@pengutronix.de>, 
	Mattijs Korpershoek <mkorpershoek@baylibre.com>, Stephen Boyd <swboyd@chromium.org>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, "fengping.yu" <fengping.yu@mediatek.com>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 18, 2022 at 7:10 PM Samuel Holland <samuel@sholland.org> wrote:
>
> The official Pine64 PinePhone keyboard case contains a matrix keypad and
> a MCU which runs a libre firmware. Add support for its I2C interface.

...

> +#include <linux/crc8.h>
> +#include <linux/i2c.h>
> +#include <linux/input/matrix_keypad.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>

Missed
types.h

...

> +#define PPKB_ROWS                      6
> +#define PPKB_COLS                      12

...

> +       for (col = 0; col < PPKB_COLS; ++col) {
> +               u8 old = old_buf[1 + col];
> +               u8 new = new_buf[1 + col];
> +               u8 changed = old ^ new;
> +
> +               if (!changed)
> +                       continue;
> +
> +               for (row = 0; row < PPKB_ROWS; ++row) {
> +                       u8 mask = BIT(row);
> +                       u8 value = new & mask;
> +                       unsigned short code;
> +                       bool fn_state;
> +
> +                       if (!(changed & mask))
> +                               continue;
> +
> +                       /*
> +                        * Save off the FN key state when the key was pressed,
> +                        * and use that to determine the code during a release.
> +                        */
> +                       fn_state = value ? ppkb->fn_pressed : ppkb->fn_state[col] & mask;
> +                       if (fn_state)
> +                               ppkb->fn_state[col] ^= mask;

Can't it be converted to use bitmap APIs?

> +               }
> +       }

...

> +static int ppkb_set_scan(struct i2c_client *client, bool enable)
> +{
> +       struct device *dev = &client->dev;
> +       int ret, val;
> +
> +       ret = i2c_smbus_read_byte_data(client, PPKB_SYS_CONFIG);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to read config: %d\n", ret);
> +               return ret;
> +       }
> +
> +       if (enable)
> +               val = ret & ~PPKB_SYS_CONFIG_DISABLE_SCAN;
> +       else
> +               val = ret | PPKB_SYS_CONFIG_DISABLE_SCAN;
> +       ret = i2c_smbus_write_byte_data(client, PPKB_SYS_CONFIG, val);
> +       if (ret) {
> +               dev_err(dev, "Failed to write config: %d\n", ret);

> +               return ret;
> +       }
> +
> +       return 0;

return ret;

> +}

...

> +static int ppkb_open(struct input_dev *input)
> +{
> +       struct i2c_client *client = input_get_drvdata(input);

> +       int ret;
> +
> +       ret = ppkb_set_scan(client, true);
> +       if (ret)
> +               return ret;
> +
> +       return 0;

  return ppkb_set_scan(...);

> +}

-- 
With Best Regards,
Andy Shevchenko
