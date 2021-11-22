Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665E62C81
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Nov 2021 11:51:06 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id bi37so79389658lfb.5
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Nov 2021 03:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=WIbKikh1dqK6JN+AMVPzHPldM9x6cOQ7YPxIcREs9sg=;
        b=3++M5Ja9ZtzByipn/0v7lU8I3UcmVjsOIIWQTAIcoBIgVKPBTzDfvRGXq24tKWYOKu
         WHLeOITaOXwgxaj5Qxiwnm1C3BhhxiGoULRWts75V4wz05nITlzBN1XEqgEsnNdP+xtZ
         3uqSOsE86Zr3oC+pfyuQhEr+/lxtrTapG3TT8V9ApQvqbVIV4VTqWVKjkZSTb5vAtfXW
         np9hnP+ZHakp0vACo0JFO14VPK0ovogjGb8BEwuQYW0j6Iva3O6sSAaNPlx2jwWYvmjh
         YDfRugKzGqtjqqlIFrm8WqPiCkziNIu/ULJP6h+RbAKi5gGabUAxss9egPSMz03zuQVh
         WvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WIbKikh1dqK6JN+AMVPzHPldM9x6cOQ7YPxIcREs9sg=;
        b=FcBtfpcPCSrhRUzM90VDIJ1kCYLpG04bQx6L0Lpm0zAcd30dsl6dBD9HZ5ZMkobjko
         9AG8hmy5h00GCFMrfTKJgVuGylWmcBwEEnEN+GPa0MFnHP2GHP12AS5Ic/ciwC3uxvuM
         8WPQ1YXdDbIMC5VaKmbzsL2KW0CiUnz5W0wkcMYp+DIWGwa/nSzeY147F7WBcoTdAwZM
         6AwxtiIA1Wcz+dDYImi0SPPhljWoZQ9l/8ME5JHIBp0vIxAWtsHi5rNJGpUy5TwptUoK
         SEcUCdPhWOzRxdHZQvAjrCAXrU4k2/kfo6rlqc9N2BBIbtb7NGRj5qyBG7cB0DFv5XNJ
         Z02Q==
X-Gm-Message-State: AOAM531x0K8YXatMVPpV2mtMHITj5yAyQeOamiLrUpaUAsnPLInCC95I
	8xrNouM1DgNuK3XDbvF4196GSIJR9hx9QQ==
X-Google-Smtp-Source: ABdhPJyVZHjFiwaN4fzFrRJPbJRE11FvJlBs9AT3WzNGLHjXQdCcZa8nhawp643sQc+HEBAZcEIB0g==
X-Received: by 2002:a2e:96c1:: with SMTP id d1mr52506115ljj.226.1637581864013;
        Mon, 22 Nov 2021 03:51:04 -0800 (PST)
Received: from [192.168.1.213] (81.5.99.121.dhcp.mipt-telecom.ru. [81.5.99.121])
        by smtp.googlemail.com with ESMTPSA id b4sm936260lfq.128.2021.11.22.03.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 03:51:03 -0800 (PST)
Subject: Re: [PATCH 2/2] dt-bindings: iio: adc: document TS voltage in AXP
 PMICs
To: Samuel Holland <samuel@sholland.org>, Maxime Ripard <maxime@cerno.tech>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Quentin Schulz <foss@0leil.net>, linux-sunxi@lists.linux.dev
References: <20211118141233.247907-1-boger@wirenboard.com>
 <20211118141233.247907-3-boger@wirenboard.com>
 <20211122104915.zism6uadgwxjz5d2@gilmour>
 <d1a18116-e198-1b26-d73a-36fbf31aaa81@wirenboard.com>
 <35630e89-4988-a6a9-b801-0e9e44419684@sholland.org>
From: Evgeny Boger <boger@wirenboard.com>
Message-ID: <86e6c742-e0ff-8f67-cacf-43a716a69a7b@wirenboard.com>
Date: Mon, 22 Nov 2021 14:51:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <35630e89-4988-a6a9-b801-0e9e44419684@sholland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

22.11.2021 14:35, Samuel Holland пишет:
> On 11/22/21 5:17 AM, Evgeny Boger wrote:
>> 22.11.2021 13:49, Maxime Ripard пишет:
>>> On Thu, Nov 18, 2021 at 05:12:33PM +0300, Evgeny Boger wrote:
>>>> Most AXPxxx-based reference designs place a 10k NTC thermistor on a
>>>> TS pin. axp20x IIO driver now report the voltage of this pin via
>>>> additional IIO channel. Add new "ts_v" channel to the channel
>>>> description.
>>>>
>>>> Signed-off-by: Evgeny Boger <boger@wirenboard.com>
>>> Would it make sense to put the resistance in the DT as well or is it
>>> made mandatory by Allwinner?
>>>
>>> Maxime
>> Well, I don't think so. Basically, by default AXP20x injects 80uA
>> current into the TS pin and measure the voltage. Then, there are
>> voltage thresholds to stop charging if the battery is too hot or too
>> cold. The default thresholds were calculated by the manufacturer for
>> default 10k resistance and 80uA current. Finally, if TS pin is
>> shorted to GND, the AXP2xx will detect it and won't shut down
>> charging. Note that AXP2xx doesn't convert the measured voltage to
>> temperature.
> Agreed, since the ADC driver only works with voltages, the resistance is
> not relevant to it, so a resistance property does not belong here.
>
>> So while it's possible to use AXP2xx with resistance other than 10k,
>> it will require us to override these protection thresholds.
>> Moreover, if one want to put the actual resistance in DT, then the
>> driver would need to calculate these protection thresholds based on
>> NTC parameters and injection current.
> That means we do need a resistance property for the battery charger
> driver, because it does need to calculate temperature.
Right now the charger driver just doesn't touch the default voltage 
thresholds at all.
> Regardless of the reference design, the resistance is variable in
> practice. At least some early v1.0 PinePhones shipped with batteries
> containing a 3 kOhm NTC. And the battery is removable, with an
> off-the-shelf form factor, so users could install aftermarket batteries
> with any NTC resistance.
I think we can easily expose *voltage* thresholds as DT properties.

>
> Right now, people with these batteries are disabling the TS; otherwise
> the PMIC refuses to charge them. It would be good to re-enable the TS by
> coming up with the proper voltages for the min/max thresholds. And there
> are power supply properties we can use to expose the current temperature
> and those thresholds to userspace (at least as read-only).
So my idea was to convert voltage to temperature elsewhere. Again, I 
personally
think that it makes sense, because the hardware itself (including 
charger) doesn't
deal with temperature at all, only with threshold voltages and injection 
current.

For instance, in  our board we now use hwmon NTC driver, like this:

     /* Huge pullup voltage is here to emulate constant current */
     bat-temp {
         compatible = "murata,ncp15xh103";
         pullup-uv = <1000000000>; // 1E9 uV
         pullup-ohm = <12500000>; // pullup_uv/80
         pulldown-ohm = <0>;
         io-channels = <&axp_adc 4>;
     };

As far as I know, there are IIO AFE patch set under review, which also add
voltage to temperature conversion.

If we indeed want the axp20x charger driver to convert voltage to 
temperature
(and vice versa, for computing charging thresholds), then all that logic 
will need to
be reimplemented in driver. Note that there wouldn't be a single 
"resistance" property,
instead there are huge resistance vs voltage tables which are slightly 
different for
different vendors.

In principle, having temperature reported by power supply driver would 
be great. But
I don't see how it can be implemented without a massive effort.


>
> Regards,
> Samuel


-- 
С уважением,
     Евгений Богер / Evgeny Boger
     CTO, Wiren Board Team
     https://wirenboard.com/ru
     +7 495 150 66 19 (# 33)

