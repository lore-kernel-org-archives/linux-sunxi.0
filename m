Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C52A4E
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 07:46:55 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id b96so6163108edf.0
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 00:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0ZqIRQWJDcAC5WtbT7TgFRmcMUbjN/uJOcvXh/zp784=;
        b=gxLU9r/njC15ZNa7u6wmpTydgDAmpZqNMGimY2taEyzEHjjMII7wiFB+6IgXe8E7Tj
         tEiKi+U/UOWI5BgH/N7PCzqY5Do6hz8mQ3uKO2ptcCp7hy+PGyH88inR6MuKIdA/usqX
         ofY8vpWAhNCh7o50QyseDquZ+A3VyEKw2hqIwB64vW8V/sR+stgRWaL3TfVysNs9Bw2h
         sLn/NLo7rTFRCVaQkz9t5NHfjvBNXXBlI1H2ToZQT7ar+86To1Ol2M0G8wM01rc8UAMC
         EP404fnL3P2vDtpig9tQU+cSAZakASLZfRp36Os/ODMalwIl7Wru2Udldvs7qG62w6qv
         em5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0ZqIRQWJDcAC5WtbT7TgFRmcMUbjN/uJOcvXh/zp784=;
        b=4IvwEQrJJz1V3bcZA/WS+JzCHElpa6RwuUONqmlk+MSsHgBBfzl5AkDAySpuNeDgxY
         r6Oxxx1FgT235xMKIZacPdtIvVMVLMfAAaOFUpmVmQ7IXZ49V5Q99CxMk5LhtJpLESrh
         r+w4QZvIXQLIue0HMdpEdYo+duI3urM4lIOxvMutyjI5DNBxLsQoUtFLJ6J2nZm6Ouz9
         SGcnS3ojOij7vOtaiCHLLf8lXvnHl7JjAT7c6nxy1l4vdOad2mxaK31CUEtGT0A9w89T
         62/jfJjot48v7y6fkyguLX5XPUDVbDw8gqbSKghMXdFgR0PTudMILY2O03WwJ5/d0HAP
         8W2w==
X-Gm-Message-State: ACgBeo03qPKKgS/frQZfpMyM6C6nVf8107RYQsJT8JCgxx6FbvVDQ+I2
	eSo2z/hTZ80KX84j2RH9LVM=
X-Google-Smtp-Source: AA6agR4PqI308kOBU328tJjNj3BJGJwFneQKD2OMYaR6Vh3pmZvoBbypevpZRbQBhX87/O3h9QhLAg==
X-Received: by 2002:a05:6402:4029:b0:443:a5f5:5324 with SMTP id d41-20020a056402402900b00443a5f55324mr1351235eda.51.1660463213805;
        Sun, 14 Aug 2022 00:46:53 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906201100b0072f1e7b06d9sm2667073ejo.59.2022.08.14.00.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 00:46:53 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jagan Teki <jagan@amarulasolutions.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/4] drm/sun4i: dsi: Add a variant structure
Date: Sun, 14 Aug 2022 09:46:51 +0200
Message-ID: <4731474.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20220812074257.58254-4-samuel@sholland.org>
References: <20220812074257.58254-1-samuel@sholland.org> <20220812074257.58254-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 12. avgust 2022 ob 09:42:55 CEST je Samuel Holland napisal(a):
> Replace the ad-hoc calls to of_device_is_compatible() with a structure
> describing the differences between variants. This is in preparation for
> adding more variants to the driver.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


