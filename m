Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0524017FE0
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 19:03:32 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-31438512cafso6582454f8f.2
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 12:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689102211; x=1691694211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmSVSNwgLZpR0raFsCoGwYAG8k2Ntlem8DSOC/Pp7Qo=;
        b=oaHblHM5peWlUa6d0SRcNDSmZaF4zsyl75i4lnx4g99nZccx2ydhPYpwAt+GAKTI82
         1Ig1iT/nj17vUL8Fk8w/UiebsMcMQFO2lPQo0wkbgypUklSfLb+omNjcDXFE4ZQIAx82
         X5/gtXYwcsJOepy09D8AUadVssEsDu4xZJskld+sKK7d7AYLrT0Tqr91UIKeRxsYPUII
         L8V+7Gdo6OLrP19nCOglzlUHehlwCX6gTqgC/qTu2FEVDqubzRN1kELVInyVdF2K69fp
         fHxYmRPlhNkn3BO7fTHv7Tn2O2ttJu+HQeqyt9CH6laKNesN9064bWCu5pmKJw4jdKNW
         Vaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689102211; x=1691694211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmSVSNwgLZpR0raFsCoGwYAG8k2Ntlem8DSOC/Pp7Qo=;
        b=ZdEiFPw2cNRwML8/vnPGJfmN+gyHaGe301xEPLAsOqM899HEiiVSI2dCjxhJdvvoyw
         XAcZnmKsuO+F3Dmd2QzwO7WVNl3VGiXn5VxW44kNjWudqgBEd1UWsg1fUMGWVqrbmcCV
         OKgVyHWY/GGiEPEfx0MCT6b7M0vB0Py7znJB+DP8uuVOnaXxlVtsHUfKuX4m/7ujqirG
         /hpuOOaFAAdHfMox++moq0yvFKAw75kMzL2r1fkQr8WU35nnLernUlhSGlVRHDTTVTFz
         vKGpAq9ml2Tqbs5pEv9Zv01cG8ZPn9z8F1QIHn99XOZu+M5UEA4uszsvbpFpLYLqz0dA
         1VwA==
X-Gm-Message-State: ABy/qLaPzCD4rGp6iSe/FBMDA4MuTJXP3Fv4uCSc6DZWDI8bO8Lpr5jB
	/isdEERWNsqVwaZy7ONIt04=
X-Google-Smtp-Source: APBJJlFuIi3pappe2fS1dup66MIYhcW7UUygU++B51fKmhaxkEr9f1RifCsk5AoTV4zbCWIkjm3X9w==
X-Received: by 2002:a05:6000:512:b0:313:dfa2:1a85 with SMTP id a18-20020a056000051200b00313dfa21a85mr18408320wrf.27.1689102210934;
        Tue, 11 Jul 2023 12:03:30 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id v2-20020adfe4c2000000b0031434c08bb7sm2958135wrm.105.2023.07.11.12.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 12:03:30 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Mans Rullgard <mans@mansr.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/3] clocksource: sun5i: remove pointless struct
Date: Tue, 11 Jul 2023 21:03:29 +0200
Message-ID: <3428514.QJadu78ljV@jernej-laptop>
In-Reply-To: <20230630201800.16501-3-mans@mansr.com>
References:
 <20230630201800.16501-1-mans@mansr.com>
 <20230630201800.16501-3-mans@mansr.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 30. junij 2023 ob 22:01:27 CEST je Mans Rullgard napisal(a):
> Remove the pointless struct added in the previous patch to make
> the diff smaller.
> 
> Signed-off-by: Mans Rullgard <mans@mansr.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


