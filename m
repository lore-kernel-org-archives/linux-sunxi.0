Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DE413DDB9
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 09:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000231; cv=none; b=fnUe0MxyTREggcUvAUeFzFv1zbweCVCOqZyHChRCJtJJTnO458Y+RPTguu5S5NUR/3HViLYzuGVqfP9txFi0nH9JyE7DF4ct5ot3mbWjdwWye4VscN+pfjQmcwI9Q0brUr2ewF4OawIgFTlPt0QLf09sEoVVm0pnCYe+ldSXBUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000231; c=relaxed/simple;
	bh=zUIhNaJB9vytQBaKjIhITCcZRZzf530pVUJ7sHGUvaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YlT1/N4wE31JrvDAdc/P82Ca61wB37RaKEOZQePhmMerPQZyQBF7GmeCFcsmefGpKJyy4YtN9InpqsBdh8LPb+1NAWKQytVFTsRBt1EgKESn+sXYbaZAjiKV1nThQIQb2c98lKYjA+npEcBIEoq1cfzAKGYraaXwuBdHfq0ZVCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rwt5T/E/; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rwt5T/E/"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111aeso3563485a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 03 Jul 2024 02:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000228; x=1720605028; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjxB4KcUaWQh3jg9jUAlCf5iQpZ5CojbNVfQpTYS6OI=;
        b=Rwt5T/E/BiNFVQLkLF3xK91yJ13ivTgsXZFWMZjNc4qRNFhBaYWWAW/01ZtYsS6yY4
         13HA7OEmWF9smuVUg9APZrLsXT2X0kWULKp5kildsGXilMuALTfxslAiMXauhcO2aOxB
         xBn4EhcpVWxCfTcQ5+Krzqvzj4LzJ1Xk5RZgJDrSSAyzchwILLFDELrTK4kTRVv8100Y
         jBYcO5/wYDjgQOAJxNnShT+acQbAN+8kQhML8ho/S8n1xUrO5UFTOTJU7Z/X3SAn1r7N
         o5uEPcHDTgUR3Ws5SNzQLGIM9J3/To+XW9d8VX7SPg6cB/ZJRQzm0enOwzInBKVX6U0n
         zFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000228; x=1720605028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjxB4KcUaWQh3jg9jUAlCf5iQpZ5CojbNVfQpTYS6OI=;
        b=LWnwq0E3Uhf+kjYMcUbp3216oOXvQqFRfuLnYAwXKy5VQlQquw9ug6hnT0SqFu8/iO
         sKPzx2Bv9YGne/okPCblZtP+6J4m0jmiQQ3Y26cEcLTEAlOZEZaNGhVKHmVk1g1M+h7J
         ygtEwBN37FimAxhK1oYu/daClfFuz1Hc2u0R10tFH+PBG/BA8hZPrNzfz73qxu/PF75z
         qOiBA+ohp++6HO3heYh4+LaEsopB9PtdYFRGuyl+pWgm/a6JSut4Bq9wh53IzUwhkWla
         lebpBKggjPca6xZL5unEXOHdmqfV6PWwTjQWNAphqel5QfuSvMiDO5pWr5+shhWCjbGS
         qJxw==
X-Forwarded-Encrypted: i=1; AJvYcCV84KHSpj+zlGmowh0hLOW5nfPU2jJwOqRPTW8sW7IVed0sYfdHTkE79ABkzsb+c3UmIcf6/KTcRU5U6qRRvp6ZjLzyP5yetapdQWY=
X-Gm-Message-State: AOJu0YzKJocPY+sk8A/m+8pJtZ3sZSHoq7AXMALYD++d8PB+4n0RiINt
	tVX3O18/MshYjhIT202cLNgVR5VRwlC2YEGaqZzaQzYLaBtUmfcH
X-Google-Smtp-Source: AGHT+IEu9wfxofZHAUHv13UpYXfpE/fqLZpj+TDjnY0WusdrAi5dE3xvADca15im/1AFnBZLLs17Ag==
X-Received: by 2002:a05:6402:84f:b0:57c:947c:52f6 with SMTP id 4fb4d7f45d1cf-587a0a0e63fmr8194901a12.26.1720000228030;
        Wed, 03 Jul 2024 02:50:28 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:27 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:14 +0200
Subject: [PATCH 01/10] clk: meson: a1: peripherals: Constify struct
 regmap_config
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-1-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=786;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=zUIhNaJB9vytQBaKjIhITCcZRZzf530pVUJ7sHGUvaM=;
 b=AiazcxboMt3P+LY+hRRrue83xM/NS7alWnXU3z+f1NiZvmZK4tScX4flzKSP5LfXviBEcnrjx
 ODWLulzhRzcCq5gs/K0LdUZbMa7Vo+Mvv37YJvGBTZSCyUOk8z6bFL1
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`a1_periphs_regmap_cfg` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/a1-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
index 99b5bc450446..728ad13924ad 100644
--- a/drivers/clk/meson/a1-peripherals.c
+++ b/drivers/clk/meson/a1-peripherals.c
@@ -2183,7 +2183,7 @@ static struct clk_regmap *const a1_periphs_regmaps[] = {
 	&dmc_sel2,
 };
 
-static struct regmap_config a1_periphs_regmap_cfg = {
+static const struct regmap_config a1_periphs_regmap_cfg = {
 	.reg_bits   = 32,
 	.val_bits   = 32,
 	.reg_stride = 4,

-- 
2.40.1

