Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533162577
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Sep 2022 22:52:11 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id x10so582547ljq.4
        for <linux-sunxi@lists.linux.dev>; Thu, 01 Sep 2022 15:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc;
        bh=Dhwd+COjDW5ThjQ0eGNlcg2FwWXLsRihwwituLHXIZw=;
        b=Qg20bj9HVOA0O2Dv7pbgLFpIerRd3OpfYftDq4iLQONPRjHm8OE5FicN0K1WL1v+S3
         bISpN5k4Xg9gTk37HMqAreo6nvuLyU3JTBpgQLIjzDvBJIqAXMP5MfRK4NHoGkdf8jpo
         3glN34VMEDD6Gh+Zf1murR+o5lg06tWVopJIiQgpwbgHGnSUZUKhfMxhxUfv/PKpvsCf
         qwtgF3sgpUqP0AbUb+d/a1esSHZ+I5KHKcW+5WE2OKOtNa+X+J/AAtNMS15RdoIDBSEy
         T+m/BQNhtbsQ6WmcJD2FSngsG3cTf0OyGVh/5RtK7l/wyzsThnJPsLTNCVmQ7lejIS6h
         shRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc;
        bh=Dhwd+COjDW5ThjQ0eGNlcg2FwWXLsRihwwituLHXIZw=;
        b=15c096ijD3koxmsUyZjt/5SYBcnYDOs/9a3nuF3JM88rSo91TSHiA4gUdsFp3x0L+p
         LS3ntYeYtjNQOmpKhUVr9vKptSkrVXYwvsWX47M+swUPqDLo3BLzaQQpU/AuOlGBIQxS
         /5YEiuMfOzLWtV1xcqTKSTikZQPoj7lYBvZiJP1hfinsf7JIT4jOXzritHzS+pQ6gpF5
         2JDWavUIb3l8+l2JSJGlhEDoyTyDszKsPFRnyWptFszxt0aL5jkiAX7YQJoOWeSJeTNh
         1YqjJxSccIB9ox0O07ZWckfiIPE9n2rbKcnSMLJeR0R2Zd7CHcAzprhnbIBAU3z7oZ2S
         ssqg==
X-Gm-Message-State: ACgBeo2lFZjwkNjLZ2pMnlo6g+WRUY2IUKbX4/ZrNLfZyaOppR0IdIIL
	EzouPwHl1ms4wil46X+/nFY=
X-Google-Smtp-Source: AA6agR5VyqkvxxIZF1flgFAUFyuS1vlvIP1xurquBEUnw5mRA/4PMLSVlwqN/Hy1Kir2419wd9jhSA==
X-Received: by 2002:a2e:bd0e:0:b0:268:c03b:cf56 with SMTP id n14-20020a2ebd0e000000b00268c03bcf56mr1277850ljq.393.1662072729392;
        Thu, 01 Sep 2022 15:52:09 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:9c45:8fa1:8ce7:8852? ([2a02:a31a:a240:1700:9c45:8fa1:8ce7:8852])
        by smtp.googlemail.com with ESMTPSA id w9-20020a2e1609000000b0025e15fe421bsm29224ljd.17.2022.09.01.15.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 15:52:08 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <768daa58-d1cd-7e9d-4f6e-722f2b0afab9@gmail.com>
Date: Fri, 2 Sep 2022 00:52:06 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v2 20/41] drm/modes: Properly generate a drm_display_mode
 from a named mode
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 intel-gfx@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-20-459522d653a7@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-20-459522d653a7@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maxime,

> +        if (!named_mode->tv_mode)
> +            continue;

As mentioned in the previous email replying to 19/41, this makes it impossible
to specify DRM_MODE_TV_MODE_NTSC_443 as currently defined in the named mode
successfully.

Best regards,
Mateusz Kwiatkowski
