Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E717B
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jun 2022 11:34:50 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id s12so16244758ejx.3
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Jun 2022 04:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=utuT6cM/eVUrce22kFa8LNAWsGwMTCB+s3XUZ2ZFqjM=;
        b=mXgpt+1B6pqO42lHUT4jA1tBiM52Ug3Jpsxo+tK8ynedBHMa0VbC/QlOY/k4MQWMIL
         sZ09fZTms2b0ER5ORbUV+AX0NpK9/vcWO6oxJlfxH6/poht8DdvaFuHJGhHEaQtJsE1P
         OcwbY/e+e2vNcoQeajDAVuJh4IYmXG2JL0WOvgETVXPqR7IcYrGQzerGpV/X0B9bhIw+
         iMuN8X4ElDnEYoEBQUr5TUkYPfadYvNEmbfNJL/1SzKuJSSRoLDx2bl3NNAk6ghs/cRs
         7HoejQdHbldmsGCRLJrfObwS8N7DKAUIfrzn1imoD3QRQbik5i3O0P4KqtqbfhZvYM5j
         d/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=utuT6cM/eVUrce22kFa8LNAWsGwMTCB+s3XUZ2ZFqjM=;
        b=NgFdY0XO7pk7SDQUqENhYocRAHuDjA8NGRA4snsPh+pfsEpxjfrUgPrVlBbhrilvMt
         HxN16JrdCbpapOsD99yE75juxL/7BYuzkAsVefFMlm4rgQJguwXH5+WEswvKdpmdFj5Y
         pzzrEj65s9/Vhmw45TpszjO9q5Qx6XgqUTzJ14mg4TjRxn6/R4fzb+n9uvFCku1U7yui
         lFzBY48g1PFW9UJjoq7DEaf47LslakZIetlmCO4CV+EtMRJQOFX5MU3Ty8xDJOyyOiBt
         0+DLo9doK7feBP+CyX12n6mWtxxiImu3vo1rs1aaym3+EqcbhNJFBlRB+dKrhHQ6loyE
         7LjA==
X-Gm-Message-State: AJIora9H6JdKMXqqfru+zLWsTdMW0CWjucAMxLAYCLx3bJChmb3g4vBT
	QiKnjiobUAif4QL89pe1ej+2aRLIyLKrblUVgKo=
X-Google-Smtp-Source: AGRyM1tCsOw9ij3ODqUgP7h7NTNnUNkfZS+idLN4MZUsf44yfptBhZ7vjHap3gjfMwCJ8VWkccJjC7/adSSxTpLE/88=
X-Received: by 2002:a17:906:149:b0:711:fca6:bc2f with SMTP id
 9-20020a170906014900b00711fca6bc2fmr16875033ejh.497.1655638489111; Sun, 19
 Jun 2022 04:34:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220618165747.55709-1-samuel@sholland.org> <20220618165747.55709-4-samuel@sholland.org>
In-Reply-To: <20220618165747.55709-4-samuel@sholland.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 19 Jun 2022 13:34:12 +0200
Message-ID: <CAHp75VfM3L-bKOLoXTz67JCWq8UX6d-LvuYDxXMtTBznGOTgSA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] Input: pinephone-keyboard - Support the proxied
 I2C bus
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

On Sat, Jun 18, 2022 at 7:12 PM Samuel Holland <samuel@sholland.org> wrote:
>
> The PinePhone keyboard case contains a battery managed by an integrated
> power bank IC. The power bank IC communicates over I2C, and the keyboard
> MCU firmware provides an interface to read and write its registers.
> Let's use this interface to implement a SMBus adapter, so we can reuse
> the driver for the power bank IC.

...

> +       /* Read back the command status until it passes or fails. */
> +       do {
> +               usleep_range(300, 500);
> +               ret = i2c_smbus_read_byte_data(client, PPKB_SYS_COMMAND);
> +       } while (ret == buf[2]);
> +       if (ret < 0)
> +               return ret;
> +       /* Commands return 0x00 on success and 0xff on failure. */
> +       if (ret)
> +               return -EIO;

Something to use from iopoll.h ?


-- 
With Best Regards,
Andy Shevchenko
