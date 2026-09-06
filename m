Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C96D3A875A
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Sep 2026 15:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788710326; cv=none; b=suotwQNyoSVBcqexJY4wEUQmyh4jXDFG+9ugPrX0isE0uUf5RSUI2NsabMuoTUBzE9XkB9lwCDE1q1Jr4zakxDh8EXLPyAC4vH3l33kalFbKVEqmFTs8/NjFIX6QBSKdT7jqmE7DKzIwVztMBgHyYYkoZg9RPJ9WkjJUmUcrj7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788710326; c=relaxed/simple;
	bh=K8U4gG3AQblf7ICtp1xRLfTb5Hvus1HZE7hzEe6OtnU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ey5tSsu6pxAvfUvNa6N0gog65mYs58gG+2PfuZXs4XcFYIAF+5m5kArdq6Bzh9eJh0YSEeimtJ1axpyZ+icM9GVYUNmuA/XSydfPRsVoCMtctwsrtgk+j77WzIcSaQbTDx32Qv0q5o4UZIibES54lfG/0rFtlPARRz3xAr3xee8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZbMpWlF; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZbMpWlF"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso2815535a91.2
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Sep 2026 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788710321; x=1789315121; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/dbxaiPStg/QuX6EVqwVigaoYbaqasF56BIGaXeKFQo=;
        b=VZbMpWlFO5Jv2SUEGs71/vu02Aol7Z64I5DzbRr6yAR141vY11Nselkq6qzDwfPKoP
         nJCLkfwdoojbmKOuhsuLzRNe7xbU99OUA+vzC+X01uFSGpHRYt7LUoK0d7ObXIZpsJaW
         PCAKNBrqXda4H6oROGkqs656UuGiqpAkfnP/x4bLH0b7Tc+/J3e28m9+yzRXYENWoikw
         guSl4K2Bdpp+3a8EkSNH8ZgTa+pbnmRf7NAibn3F4Z0HfvVJQCGIkr146lDE5nKRsfbL
         KuOrEdylvVT0rFPn+Po4Od13Asd0gFM5qfssgCO0ilZM2wXyvt7/MDwq/xyJl2TIZ9gr
         OfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788710321; x=1789315121;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/dbxaiPStg/QuX6EVqwVigaoYbaqasF56BIGaXeKFQo=;
        b=AhlpSe61dmE1Txxc37Zc4m9QddQpBkda+BTMU0ZCDA3NJn6hzQlhdI0qvycLu9cZ3c
         YCtKKEscQ9JH8ff0Azm13FI8GyRv1/7MoNbWCoTsbbuCXf6rwRm0L4FXOfQS7tTdufxN
         tC1pomaaD1B57NZgu//GaXYp4ZbYLu2kKHu2CemOc3VKkNxwhrIy84VzXjnMPF3ZTk8/
         8BI8Zn1MYZayBr8d/v9fMDM/VMnxfq1CjrNkcjFPoRLWGTXCSwY4A16gbjJJ/M7jeX98
         eesgzmCB4EpIlhYwzBbDErvinokoZEs4w4P/9jwfK4Nww+MXJrE7RyOA46CBhmFnCO9K
         T9Bw==
X-Forwarded-Encrypted: i=1; AKwUvBy2osB7mH2MGmoqjFhfoc/5RnkfBJ2C1ezDOwGzhMf8Qz8mEukDGLd7iiG6AcTJe6Zb2/njT9QUwJ4M/g==@lists.linux.dev
X-Gm-Message-State: AFuF++k10oFiKq6jjJSXY6vKI1HTHy0RLKiHd5EHHnJLVtqbVS/tur9Y
	AmP94P69WaEgGcX4yAHYp2u5kYyiezbmZgsVM5+rR+WU1a7u5T0/OQOJ
X-Gm-Gg: AYBFou3+mJOwNZcaQQJEgGIV+6duO7KvyCE+2FBdVBlO9gIhG5SLn8nKfBQ07UzUSIE
	FYc5tKjHR4iQsZVuWeKFCNPzBim9ZJ7ovH6NYLKE3j+SZn8A6oDJ6DfjBeKjIvTPDX5Y/7vBXeD
	sSra3JRF0HBQ9Vk0IhqY3L4EWt9KUTaBSgPmAJlfFhLfIp9FISZmZ2oDv66Ott4uXH3LsooL66q
	ME5f/MjSD7qUjvmG79xHBZhu3Sb9TkPmKEgrhJSZRVGDsg6nU5ONBQtkl+Krh9CDMEvrn0Uee11
	t+H+8EiYeKA3ZLuYmK08nillqqoW08l9KL72HprBNUWzmkPr52RMYHXyPLdkBozOSeJv7mavDUA
	zykLY8cINxYMVWt/X2UfUc4WfAQkkWObST6H1MlYQdza40wbgiJDh+2mMD8M+AmK21MizEeHuDW
	h6HLHgiPgb6/RDobsun0LpuWj2iQVD6dT7pShgcvhoSASPX3CJutDjAsCH4qDuokuEHFNghS+JZ
	ewEg5um8xz+vwjmc5cUn5t8NpQD9VWx8SNj7JYxckHToTCcWM2Ylpc+b3GVYHxKL1I=
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr26240194a91.1.1788710321449;
        Sun, 06 Sep 2026 08:58:41 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260f64ecsm15941401a91.8.2026.09.06.08.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 08:58:41 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH 0/2] iio: adc: sun4i-gpadc-iio: two fixes
Date: Sun, 06 Sep 2026 23:58:33 +0800
Message-Id: <20260906-gpadc-v1-0-92d3dc8ef355@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwMz3fSCxJRk3RQTwyRLM5MUizRDcyWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQDWtQlxaQAAAA==
X-Change-ID: 20260906-gpadc-d41b964d8f17
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Quentin Schulz <quentin.schulz@free-electrons.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>, Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788710316; l=477;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=K8U4gG3AQblf7ICtp1xRLfTb5Hvus1HZE7hzEe6OtnU=;
 b=KKdnvVHGc9z66Nr5HNx4ntRPqRtsqEijnBCzDHcZaEUJXlQxGGQqVwgyS6ym5BVtkrrzwfg//
 vFo8QEpNRFWCBfN3nxQpm1Vo5vSvRI+QU5qCcDHZdotA0ms+izqTQNT
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Felix Gu (2):
      iio: adc: sun4i-gpadc-iio: drop underflowing pm_runtime_put() calls
      iio: adc: sun4i-gpadc-iio: clean up on thermal zone registration failure

 drivers/iio/adc/sun4i-gpadc-iio.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
---
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260906-gpadc-d41b964d8f17

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

