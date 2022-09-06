Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75F386E9
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Sep 2022 20:03:03 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id r4so16582759edi.8
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Sep 2022 13:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=F6ib7HMkD8OZCaZPl3GcVqEvWmm4ctxdEGHR+aqIKVc=;
        b=ArRU4YWH8hE+2Z1UVe6QOKE5hPjwCYDsbvdE1/PUCWN56FAMQZ/4zqvMIxfOOB2keG
         VETEDtrmessAghGKMzFBp8CyQVDdAQqU4x+gj9gaRUZoj5nIhCcQp0TbKqYFac2p/l7c
         s8E+JhqrISyguo1blQmfoTPAnbUnCSoWPxO87AW5Jnu7jG9ZsEG2SFveoy3yVuaEmC/j
         AJGJVNakAM7s7v3qVwNh9qCbZDvWMeFX5CX+Yh1J7gk3RyIO+elUjPVl8TzAtf+ajC+9
         gJrzytdJaqd/ImlOWyICFY6pKT6Gkrs3MV9zjaV5uubNzgLGsQ1rDLq1Oj3ES5Fk9n3N
         yT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=F6ib7HMkD8OZCaZPl3GcVqEvWmm4ctxdEGHR+aqIKVc=;
        b=M14ItWHHC3xTqGbYpQD8MX80EUJ6/qXZ8iA5hmX0UTHRHjQeP2QY8QTQwoFiA4LYXS
         Au/3pmQkrZJygLyYwERrEpByzFcmo9Hu0GvSuQZdgbx4rXii/iUmefcVrxoPqBGgBpYc
         Qml0LBtoUJ7vIjdd6KfSJOZUmreuX+ZKs/8CTsTVQpe6UGm1j59sTO3ecys0D+z7RqDC
         OHF8nMwFWy0Zcl61fx5LfoEKWRiKOtyF/CmrnIH9YvOEEMD0qYFa6xIBV73iq35fYCpN
         ID1OhRZYmPeCYoP98Z7EQW+lQCbcIkGTcVgujvffiEaWpwWyFuN+19HGlIg6Awb7eR4g
         r8bg==
X-Gm-Message-State: ACgBeo2zIddxyzuR5axPkP2x6ZRU0QVvoKEyg2+QGVzq7ZcLpX+TNrO1
	KFtzvHbORSuTYPd4nhD/s84=
X-Google-Smtp-Source: AA6agR5gwvJ8nN16z0kDOnfFe8gSYaFolah5D1v/bfxdS5M65ePk383S/fOmy1b3my8s0GvcbJd5jQ==
X-Received: by 2002:a05:6402:2499:b0:440:942a:40c2 with SMTP id q25-20020a056402249900b00440942a40c2mr225612eda.37.1662494582166;
        Tue, 06 Sep 2022 13:03:02 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709062b4200b006fee7b5dff2sm7207555ejg.143.2022.09.06.13.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 13:03:01 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>, Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <maxime@cerno.tech>, Hans de Goede <hdegoede@redhat.com>, linux-arm-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>, intel-gfx@lists.freedesktop.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 35/41] drm/sun4i: tv: Convert to atomic hooks
Date: Tue, 06 Sep 2022 22:02:59 +0200
Message-ID: <3192228.44csPzL39Z@kista>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-35-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech> <20220728-rpi-analog-tv-properties-v2-35-459522d653a7@cerno.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 29. avgust 2022 ob 15:11:49 CEST je Maxime Ripard napisal(a):
> The sun4i TV driver still uses legacy enable and disable hook
> implementation. Let's convert to the atomic variants.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

BTW, I suggest you merge fixes/cleanups, no need to drag them in this super 
long series.

Best regards,
Jernej


