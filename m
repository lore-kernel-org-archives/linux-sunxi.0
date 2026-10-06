Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42352BE639
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Oct 2026 21:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791320611; cv=none; b=SPr6uJ+xHXLzewjQ1RfJOaGAuccs7QuwvAsPW5WWoG4ySBwy0Y4s/s6VdidyUqVP0k95rRM2XWeAauskbqifTYZobI2qts2e2vA+9tOJi7M1/fYM5jKq+XUvlS9RAb2nOlFHsGEXiJdGqleupmaukuR/3XTYcFbJR6sdhmTiBF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791320611; c=relaxed/simple;
	bh=ISf7Lb0t6b8ylOEcWRDSL9BmaWLi8p6rYhKIlR06ZHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eopD4WvLdalX/5CfcWlLJK5LsqiDx400aLh4Evbut8cAjJOOgBDtcWVTDfBmFUCbrOlgbhfKOO9hedU+qjuwgc4AZ9F/zkNWr3AjRWkZafgmfuyor4QFkeA3RBCXrw3uMWziJ45IArw7mIm+rIHiwMYkeb5Nha/dNrozBqK0CW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnVxBzCI; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnVxBzCI"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso464449166b.3
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Oct 2026 14:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791320608; x=1791925408; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ylT2JTUORypj+MjhE+jQDW+T/v8WU4XCGcgTDo3Q5yQ=;
        b=BnVxBzCI7nK42E7tlkq5NjSimAanLuVwH9JqmZNTuEcH8s6rUTVsFLAfhUwjJv+LU/
         RBTLY3dsM8jteJhHiAS3aIbWrK4XggXJDpUigcBenvwciug8D8R925z0n5ePeNqDTN7e
         rD8B7jS15kQ8TMJwmON/3sizI2z8se/m3rTom/1ULM2oKMrVbbF+tg8173SnK6PmyKmY
         N4GBMAk4O30F4xjiHBmxUcevG9e16VGPzdWTfQ5QuL+u3vStExbJ4qM9IbubQKJUEwrL
         ORuSuyBOsif2P0rQf/e6BBFC4wI64AWC6IiHBoCmW7lTulqbQp5ZhAgAksYOJTgoyOmO
         MELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791320608; x=1791925408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylT2JTUORypj+MjhE+jQDW+T/v8WU4XCGcgTDo3Q5yQ=;
        b=2dANxR7SzLhJIGQlUSbG0w332PR43yqi9Pqfk5wNlczUwziGr+VMuhTrB6mhz09lwm
         pefFVZPTQ+chMaVygCjPo1tVOmUl5w343R8d8Y+kNIG7Xj/binVxWakgMr+crhpSuhcm
         aluoSP9Vli+m2CPGy0uYapKX5jGeqaH2bqqyitq4/nUKDSxn5qBYT1OTeJFlKdM+Ragc
         h1xy/j77nwOCrXuuwkRBBKXzjV15RilU1nVbLpJzlFWxadbVZuDPWt9At+A1qXNZQf+b
         8kUelHIlunquU/0hq4yt2X3F969+vqJqLkvxOpAdjR8a7l6YZ+lXTouazVYfXYUbPgeS
         Ktnw==
X-Forwarded-Encrypted: i=1; AKwUvBzm1tXDm9favcDnO+W7G41nNeBLkaAj2W/9iAkJCvV0PlsE9ee1ssks30/Cb389B9dZq4BQe0hxW0+GiQ==@lists.linux.dev
X-Gm-Message-State: AFuF++k/wY0Y0ciDZnb7OMMHv34H6Vn/YFaybPmmW7Ja6VCPvBkJ395e
	LvL3J2r1epU1WFoZV7kZTCg+iNVf04ePdzlmSDUHfoU/3xhdDI+Er1oC
X-Gm-Gg: AYBFou0Iamwej0tkY8CI67p+haVzLR6fUAMc/b0WcqtfWcLoB2gChqDgg6JELdnYG8F
	Loqyolsy7E/AcZyh9smr36BdzKtSunt9QWWuJCMyf6YtGU2mvebw3OZlTK9OAzu3IRRwY+OKIkP
	wezMtWBkmFR+jJmOtbcx16/px7pB0ArRwIk41bG20Rzf0DhTeQGpvBXD31wWx5J0kHVbQwW+FZC
	vvhwQe54ZcXp1YvvZjO6CjxwkKoPLZ/O0yZ33xTuPATD83bK4dI2ZPkweBBYCJUoFwkw4O7Euu/
	7Z/ZmEZOYOPiEJ1ozZu65bb9s6FlBtVjEurcnR2KRLtUvHS9R1rJE+Q3RBR4Bnl9xDJQgTHC/Kh
	Ot8nTERBGj8PgCnmsFCrwMJLC0IdpZlQMkAtuZOx9VcSpIj9QnuIPPas7XW86f3OqWdiodZFUn9
	mQFl6uEgTJoCpAyy68G9odgt2lw1I9I26fn7pEUN3fEqwut+9GdC6LLzNyAAsgD7kDMtrOm7Rto
	ILwPZZQRSaPRJXpRan8Qj6+WNXJTsmh
X-Received: by 2002:a17:907:8992:b0:c29:5021:f6f8 with SMTP id a640c23a62f3a-c317c0bc3a7mr23014166b.36.1791320607819;
        Tue, 06 Oct 2026 14:03:27 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c317c2f9938sm8483166b.50.2026.10.06.14.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 14:03:26 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pablo Mazzini <pmazzini@gmail.com>
Subject: [PATCH] pinctrl: sunxi: dt: do not accumulate npins across probe attempts
Date: Tue,  6 Oct 2026 22:03:13 +0100
Message-ID: <20261006210313.43163-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_pins_table() adds to npins in the driver's static descriptor, so
after a probe deferral the count doubles and the next probe fails with
"pin 0 already registered". Count into a local instead.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 50a16f3bd131..1c1888394cf1 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -75,7 +75,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
 					      struct sunxi_pinctrl_desc *desc)
 {
 	struct sunxi_desc_pin *pins, *cur_pin;
-	int name_size = 0;
+	int name_size = 0, npins = 0;
 	int port_base = desc->pin_base / PINS_PER_BANK;
 	char *pin_names, *cur_name;
 	int i, j;
@@ -85,7 +85,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
 	 * Also work out how much memory we need to store all the pin names.
 	 */
 	for (i = 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
-		desc->npins += pins_per_bank[i];
+		npins += pins_per_bank[i];
 		if (pins_per_bank[i] < 10) {
 			/* 4 bytes for "PXy\0" */
 			name_size += pins_per_bank[i] * 4;
@@ -98,12 +98,14 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
 		}
 	}
 
-	if (desc->npins == 0) {
+	if (npins == 0) {
 		dev_err(dev, "no ports defined\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	pins = devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERNEL);
+	desc->npins = npins;
+
+	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
 	if (!pins)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.52.0

