Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93D15CA6
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Sep 2022 19:55:12 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id d5so11575182wms.5
        for <linux-sunxi@lists.linux.dev>; Thu, 08 Sep 2022 12:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ze639+PCW1w/1gzP9YrJsTcy8enh9M6YW+cBRHStBHM=;
        b=eI755+/JrHuVT4ZUClHcldAg3qKaDAIl8ZYYAjjL/iFC0VYHY/D6VN4Z7N+zZNsQe1
         8mBNw9wWVip4sybiJ5OmLV6lPSagGxbea2maGdvwG5LgnZxIzynrWXCznblZADSNOeBp
         4iXCde1WgUlinCzu792ngEaRVZ9wcYjConrodIm6PwfPtk8NeLovUJN7W2F+o6km1eWB
         fMyLSwg2gK6bTFWFY3SUVSx266ijChnkgL7J6zF+irSXh53W9vHV2dC+690LhNbVFPS8
         krkNWsEGNgglpDyJnvIqHe416220WU85RKcuO6PqqhR+wc9q/LnM5Nc04WWmfIAzWjI2
         BYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ze639+PCW1w/1gzP9YrJsTcy8enh9M6YW+cBRHStBHM=;
        b=Y+BosLCkZpK7Wk+04Denj8sxd1XyyEyeez0tNFg7u3Yrv1A905Hh2VfYZiVvXXfleC
         wc+ms0vyaYvf25bU+Si9g+82YBBn4fHf0AWnQcRYppTU1UU9gwQC+blhOtSV5bADsYm1
         DRpVqnNmRtoWcDQqk1WuYN6wkOLmhRK/x3PuN3lHC9SR7ZPxI6S6ikGkcZUfiQjxOlTv
         Y8IV67teFO2uKBTLDO6Wlr1qkVfvMNzZtBypKg9FwAr42AMiYhIMFv8ZPn3FOdGyCd30
         ZXGajM+1lVvPeqvpVldkzDLDWvslK4GqjkFv2U4Odho7rLvMZFCDPG8KmaDoj7b9yiUf
         +w1g==
X-Gm-Message-State: ACgBeo1k8UNloyCd/orVYayx9caw1GukeY29BiyuZiofhkraK62bUySh
	Zu6e3Ux3CXNOUykz6cWp/2M=
X-Google-Smtp-Source: AA6agR4uOK9Y+XgtBif61scKKj69FBQPUc6mobXPQibWu1bZU2IkD3ZcYROeOEjv2Eq3erchmhaVng==
X-Received: by 2002:a7b:c848:0:b0:3a5:41f6:4d37 with SMTP id c8-20020a7bc848000000b003a541f64d37mr3495955wml.23.1662666911070;
        Thu, 08 Sep 2022 12:55:11 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id h2-20020a5d4302000000b0021e51c039c5sm21346668wrq.80.2022.09.08.12.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 12:55:10 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, wens@csie.org
Subject: Re: [PATCH -next 1/3] clk: sunxi-ng: sun8i-de2: Use dev_err_probe() helper
Date: Thu, 08 Sep 2022 21:55:09 +0200
Message-ID: <5296377.Sb9uPGUboI@kista>
In-Reply-To: <20220827094151.3323450-1-yangyingliang@huawei.com>
References: <20220827094151.3323450-1-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 27. avgust 2022 ob 11:41:49 CEST je Yang Yingliang napisal(a):
> dev_err() can be replace with dev_err_probe() which will check if error
> code is -EPROBE_DEFER.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied all three, thanks!

Best regards,
Jernej


