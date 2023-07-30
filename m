Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B7514F70
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Jul 2023 22:53:11 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fe11652b64so6359511e87.0
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Jul 2023 15:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690757589; x=1691362389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LolaIywE6Sh5m79upv1Hlv7iJcp6yOQ3wePrb1ubGYo=;
        b=jTqShHh3AKaXKv+/TOf7Dw67nNE8EsUvCRjvuM8F9L7rnfNY2qpL1Q/maOoBmdqtab
         Q1qbNzNQq6ZqXcm/LzLenqy4sKr4vz3kR1wrDmMrmQifr8G+SEuHb3i3ArBT2VL7TLj6
         ZKfwz4Lz4ssg1H1ZlnnIDg7VZD+nbVRBNHzrfPlFVnw97Q0sMpavFJT65tdagB4NVqo6
         3OnApNsFLLk7DJWQwtePRfmgIw5tEhHz6xU5oGxAZtGNthrOaRCk2wTmFyyX9g7flkCW
         rrtIxgsT1dXHW3srqz+8ptSc0Q1eGoWuO4ae0Eng4UT7f3bHK0HP7U3d8EzezP5QOtzY
         nIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690757589; x=1691362389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LolaIywE6Sh5m79upv1Hlv7iJcp6yOQ3wePrb1ubGYo=;
        b=QyaOybm5ZPcPLuYUcqLm1hJ3ktQql/wneaLrC3orVwQG44U0IGzzrauXWtGj7QL1w0
         kIlsjCYXeYAJLw+FZ8H7UL7fVA63z8+LxUWJsQ3mvq8WNn3KPVUuWncZhice5dADYpHG
         o7VxKyBnN85AV4bZdBvm0EK545D1FZRQEjhc3m3tfmohC2L5ouSjCmmSeov/IDs5WLIw
         mNfzUp3+W7y9QGcOVf1abwFX7Uz6wNCB+h2SdAAyv7dMs+5xtvlx04pOLHPVA3jXlUAK
         IQ1IseLmzXSIos5/90evzIp4Mn5QBC+A4D0UGe99s+SkzlJNMHJs/qvJAtLmsSQuvlIQ
         YhRg==
X-Gm-Message-State: ABy/qLb+cJ/mjsl8hYMW3GONv3fRTZHsFXlVn1w4FzpKSTRrBdiBaCde
	HNJ1MsojsK7Mv5D2nhBR44LVKwU6P0Bh4nyj
X-Google-Smtp-Source: APBJJlFcCh/Jqh3WTePQM0jpaW7rqln031MmdUN+IobVOmTzYSo6PVlzPI/t5X0zqw0y9G+PCtE+Fw==
X-Received: by 2002:a19:ca5b:0:b0:4f8:710c:e2c7 with SMTP id h27-20020a19ca5b000000b004f8710ce2c7mr4263989lfj.33.1690757589451;
        Sun, 30 Jul 2023 15:53:09 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id v24-20020a1cf718000000b003fc05b89e5bsm9604089wmh.34.2023.07.30.15.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 15:53:08 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mturquette@baylibre.com, sboyd@kernel.org, wens@csie.org,
 samuel@sholland.org, ulf.hansson@linaro.org, mripard@kernel.org,
 Zhang Jianhua <chris.zjh@huawei.com>
Cc: chris.zjh@huawei.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] clk: sunxi-ng: Modify mismatched function name
Date: Mon, 31 Jul 2023 00:53:07 +0200
Message-ID: <3174068.5fSG56mABF@jernej-laptop>
In-Reply-To: <20230722153107.2078179-1-chris.zjh@huawei.com>
References: <20230722153107.2078179-1-chris.zjh@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 22. julij 2023 ob 17:31:07 CEST je Zhang Jianhua napisal(a):
> No functional modification involved.
> 
> drivers/clk/sunxi-ng/ccu_mmc_timing.c:54: warning: expecting prototype for
> sunxi_ccu_set_mmc_timing_mode(). Prototype was for
> sunxi_ccu_get_mmc_timing_mode() instead
> 
> Fixes: f6f64ed868d3 ("clk: sunxi-ng: Add interface to query or configure MMC
> timing modes.") Signed-off-by: Zhang Jianhua <chris.zjh@huawei.com>

Applied, thanks!

Best regards,
Jernej


