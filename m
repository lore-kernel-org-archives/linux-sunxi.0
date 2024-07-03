Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B57217335E
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 09:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000243; cv=none; b=HMO2ANql8CR860HjOje5nIDWgvXOGtr2Yox+2+RYxrnf2QWXox3v0KMzebLbnPUbzWHSa1XGPo+9ItKgK1A26jMgzxE9w8d60GELJC4SGvjPGdwyKeQbj4q0vj7kSMqumTbesaipgKLrMDlAZyj2xtQkKsE38NUQ1Yzzc+jleZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000243; c=relaxed/simple;
	bh=4FCNr5GOWcEA6y5NqdpifkLm70epZYiiKRWR1KypcjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZixHBzw2gTRgGdm6rwNWxQ2zuZWc4em9LeAxbPoktjBEyz8PcmoEWEe5w6TqSqbktroMM41uuA9TzUO0eDdTBZmlV86Hni/0ZB7ZGfw4+0DvlWAIGtpIAQN/9pdZDat+dc8fMy+LTN3BmqmGDsT0rSRmVz0GFuElKr2waA3eRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qi3oKnnI; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qi3oKnnI"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57cc30eaf0aso1639965a12.2
        for <linux-sunxi@lists.linux.dev>; Wed, 03 Jul 2024 02:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000240; x=1720605040; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiCqBhqUCgc2qlo69kMyfb9Kw0XmXS+HbWPYR88AKtM=;
        b=Qi3oKnnI8icxXoBHrVUMXJwvVWcEBejLnQ8gNd2Ydt+db3+VqojrwMIH6J335m20m3
         +saq9UZTefqG7U+UTwuaRbBnXewt7/7AXx2dEvfYF9gCpxqRgKB5oXK9RuKRSdyvL5q5
         EOPUiOrLZK8texKMq+1YHcvCmeu76gBYAtZIhtMQgxYkEntnwSvPj3JQxIUhGGlFSCCS
         ZvQOG/gYnLKM0iNlMU3q/ewRJ67Yh1Bc4jxEsBeQVII39sBwkFPV8f/Ztbzmq+1qoy6G
         T+71SspLZoAll1bz1MT8rXi1P0MjzQ7dWniv+2SyMm7UxLiFNZikfLGcs7JKlR6IG7L+
         cniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000240; x=1720605040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiCqBhqUCgc2qlo69kMyfb9Kw0XmXS+HbWPYR88AKtM=;
        b=URDJU9QWbl9+B3Mdvqr46q3By9DmQIS9/h2O4Ei+g80i/HVzEUbfUaHfL0s2M2Lzu/
         nYKvK5qh0ZscdSiO99h0IoQFUBs6+TfHDo7jbtKhPTTv02KSvxFNS3i5IOu13mvUI1B/
         7vOwp4+wbAMOpckqjtEfVW9guKbG3PaFb1O/1im1iZb4ipP7qjuu/PrGkoJI/KCaM9KJ
         kE4NSgZYlybPhQDlNdBZtfs/Z47wajcRVrNegEIOp/itrkRhNuASkTnCLn43UeLX33MO
         dKfWY7nJpyg+KyXlHNrg1QFV1BKN5UFdn9sj2vNeEehFr4sVD2JFDYEV2e7AotZYEgPO
         GFcw==
X-Forwarded-Encrypted: i=1; AJvYcCXCWX30LkYi0MTQvMfUmekIZ6u8NUC1YM52cG7huTg30tVkyhP8n5RRn4YbTFzjA8s0Nv55BGOHGqB2bK1JqqbiJ40vTs7+hTlkycI=
X-Gm-Message-State: AOJu0Yz+HYU0u8X6dX9vhsBdB7PpoFNA6ICDO1jTDY6qacnJmsQrXgX6
	0sG6UJUOatuOXMdhXwdQj+3EwFyoD+GveoFBWWHKRe3UxTPq+Be8
X-Google-Smtp-Source: AGHT+IH9+soogFDEvM3qfzATv+xM46StvZo3k4+MIXApLMLfrZb95ASnqwtlsqhaymD0ber1BdzxkQ==
X-Received: by 2002:a05:6402:1d53:b0:57c:dd3a:f399 with SMTP id 4fb4d7f45d1cf-5879f3ac31cmr10795277a12.12.1720000239972;
        Wed, 03 Jul 2024 02:50:39 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:39 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:22 +0200
Subject: [PATCH 09/10] clk: sunxi-ng r40: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-9-7d15a0671d6f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=823;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=4FCNr5GOWcEA6y5NqdpifkLm70epZYiiKRWR1KypcjM=;
 b=hxckhw6snFQZeQGymAQKqS0eL3J2chT1g/zqB+Nq3f/23Ef5U+/1Bs6WOELhWWFbyyQW0D6hS
 pI0dG8mxc8nCvqABfGl2sjQpU8VqFqsdaygU+yFnBzBcOvEHmee/pmx
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`sun8i_r40_ccu_regmap_config` is not modified and can be declared as
const to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
index 984ad3f76b18..2f51ceab8016 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
@@ -1292,7 +1292,7 @@ static bool sun8i_r40_ccu_regmap_accessible_reg(struct device *dev,
 	return false;
 }
 
-static struct regmap_config sun8i_r40_ccu_regmap_config = {
+static const struct regmap_config sun8i_r40_ccu_regmap_config = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,

-- 
2.40.1

