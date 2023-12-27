Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EE844C84
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Dec 2023 13:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="phUMpbos"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40d5f402571so4321515e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Dec 2023 05:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703683531; x=1704288331; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XnuJFTcaPg+7yorCOh56XX3MuEjCkxA2g5o6RezlZqw=;
        b=phUMpbosH/fwiDdl5thYK62ZL6CLvzZK1xdycSZsg9hcSzyr4T/Y8/zCA27shPz+tg
         Pfglm8FfRrJak37+C7Gy5ok0Kzl6c8DcOkLdO2/mNVildz1Jb+HF6yke/aBmt2YdgfaR
         lZsvURhx4jQGtCwvXF7257Of0apmeq9WngbIsFOLG60BKVp4QvaJthLKeiS81GO0KnzS
         1iWUL9/oKj5V7w9h9scodr1YWxWITILFpe4/YVe/OcUkXlX0v/picONvrCAt9Df6cati
         GUGFjbZqm2PFUjb/R5HFGlIKnvOZWELlyX2JmZOOiHFxWuucpfWZRCxT2jeR4NvKt9i5
         +bHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703683531; x=1704288331;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XnuJFTcaPg+7yorCOh56XX3MuEjCkxA2g5o6RezlZqw=;
        b=XW3eF4m6bHTd02FWMcvIty2dKJredN2tBjg2UJJCc/vHCM8iDIH+lkVWQ9sV4BrDqQ
         JsY70VF+tPwUAHyQ8hb8pEw7W2S9Z/E/yVH7F3Ngnnh03G2BGTzaSoXRiR9tpdO7bl8i
         Jgo6cNnQ5kxr+BjcNEzj0SoUKECSbgGTy9VXGttx3kjkyBWiJx1Enh2E6Iz+T8hGkEV+
         N+VlMon8T3/uum2cuWCOLomUb5X36MNApB8BpMKMc3tDo2RoiTN2PmxOBq5jf5G8A+sH
         IGHT3up4tF6D8zB+b/9YUczi8oAoLuXCu4wTSezN20wCbulYqUlO+ksE1DoWjO1iF62B
         Fa2A==
X-Gm-Message-State: AOJu0YwFjNIqNYWcmBz1mrFzcRuAdKECt40GQ88m/20oHI4csOcYl+mI
	b8xtuHMqEeWU+ZAozcUq8NDYWy5E+Ad4zg==
X-Google-Smtp-Source: AGHT+IFlK4cgUWuU/jWJrceWJh4lJpVSMiBHpX1FYCBlQRbZHkzzg+ijYf8Tc5zNd9CVFokKROA8ng==
X-Received: by 2002:a05:600c:744:b0:40c:3508:b40e with SMTP id j4-20020a05600c074400b0040c3508b40emr4296673wmn.245.1703683530729;
        Wed, 27 Dec 2023 05:25:30 -0800 (PST)
Received: from linaro.org ([37.166.4.200])
        by smtp.gmail.com with ESMTPSA id n23-20020a05600c3b9700b0040d5aa03ee0sm5381059wms.34.2023.12.27.05.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 05:25:30 -0800 (PST)
Date: Wed, 27 Dec 2023 14:25:26 +0100
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Martin Botka <martin.botka@somainline.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"open list:ALLWINNER THERMAL DRIVER" <linux-pm@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] thermal: sun8i: extend H6 calibration function to
 support 4 sensors
Message-ID: <20231227132509.GA4121@linaro.org>
References: <20231217133637.54773-1-bigunclemax@gmail.com>
 <20231218111404.5f08a4c4@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231218111404.5f08a4c4@donnerap.manchester.arm.com>

On Mon, Dec 18, 2023 at 11:14:04AM +0000, Andre Przywara wrote:

[ ... ]

> I will incorporate this patch into the next submission of the H616 THS
> series, so there is no need to merge this patch as is.

Noted, thanks

  -- Daniel

[ ... ]
-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
