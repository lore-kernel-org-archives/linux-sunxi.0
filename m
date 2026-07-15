Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E643C3450
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109385; cv=none; b=qeb8bso4LDWWsQ/zbEgF9kGPZlx791uZ+N5Cq/vkBn8xeYBi1XtiBm3glHOrPI6QCk8YnhnuH4jM2yJJcl3YiIg42d6NorEKpRKWJ7Moh5xvDzfSwZfpBY1DfyLPCSSC59GYLL0C3RAkC3quS/S+gKYE58NkzUEwcPo8HXYhg5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109385; c=relaxed/simple;
	bh=RVMpE/2zJngbP2l7dUgGImsnDYyJOJke9NWacK4SwV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBxhNtaBU6mNT5Z6j1RT9el/oQ1VtvUiWLNWDo/gIjoPpu99ZsZAP3yHrEGoV5pr5ss5BHPNyjOuNVd7C61wegW1DqxkgBW9cXPljaIbjG6dpQUL+CkVP+RzpAQysAcy8lx0UIZjW8xlNynmSTvTNFXsO0bbcGnEgJuj6u2mt14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aL/1HYg9; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aL/1HYg9"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c88a4d79ba5so3412506a12.2
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109384; x=1784714184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMaB8cZfcOw4iICxwreQT8955W297Mz8pA/NoRorvZg=;
        b=aL/1HYg9QHiIEErPXG/6Do9k8k+xwjq6L6NPZELt/RbziJnhr24g7syfLr0IDGnA7z
         bbb04Uwd7E9kznF06IigO0niznXIgP9ZXw8fODSEHPbg4+1qvlyOfIavyKe2Mvs3kjoX
         K2/LzXhYf5Dq8irGhrgipk/evDwGopUDrh2o6Q+YLNuIW7Z34JUnN/zNA7aKNJ/l7LxE
         l0cWtXA20R23ugmyZNArNafyGiVbthDg4grabYCYwV1No4tTcJBD+GyJsFS6c6PHfk3D
         4quJ3wgncbg7quAkNZ13VuW/iU1eoGaE4aayWD0UoAksXlAPrhFEH0zWxdzQST7HHcwk
         64iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109384; x=1784714184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hMaB8cZfcOw4iICxwreQT8955W297Mz8pA/NoRorvZg=;
        b=bKUxDwRVie24Z/sMfI6bqCEhKaYclFhYuimFQXagiS+F+g72f9BNuwUG+h+qCOtVpe
         IYpo1XZ5zsxaz33mUApKFhfSA9B4XiSTahMMVD9BFS8kQb8y8y3oDjEfeRd3Pi8sxLgx
         9Uylx+vkL/oiHR4njNzF26h8xtueP78s8mjEI/qghXR97ysBkaGo712Ta86eXIv9aE8n
         vSkfUXn1qsVHVqmMNQV9nUmKZxVEU+rZNbc+PbhmPvv21MpEbc6LiyGZEyzt1vj9fLtT
         FvDEM2qt3ZHCQb0L+nu9DYnW7KrSvnSGvzmfIGST5I87IBgKl9sN6RadxDm1xLQvWo4t
         xp9g==
X-Forwarded-Encrypted: i=1; AHgh+Rqow7JZQaW4plELNMFFdJBLNEqy5HGCgU1GnNiMmDDy9LHLQZh8rXfXn4JOkXAyYDeqlZ/UcCbx3IMSaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxkglx7ctNgoAHnOBHNn8r3FnXK7a2n9BTgFkVdBC0j2yUfiMVe
	TRgajqP6Cytclk/sA8bqbKQugfSgIGY6d4geBngyY9+fO5hkTh1zTyZX
X-Gm-Gg: AfdE7ck41AebPNrkYL46olt/ASCpQgmoJ3j/kzypYsZKGiF8jVL+wZEAVmQKAmcoBoT
	yje0gwBwq5Vb25rR8l3FoJRN13Ewz9urYurAQZBTATly7ExF9SI6gFYLzbo7yaTlUb4NPTbBhAF
	Bj95xakKhKrj9DSho3PVQoxYsy0XzUvWGJAXyJ0+W6PcaivFsR/hpiN5A84WC47JL8nMp9P7OyZ
	1yfUQJrIcNsmaNttsmcyN7SwI6VtIhkpSiMefmilCegsHuIjCCMoSIXjFGtSBSAqzvnyHPG/zYq
	GCAQJ5DDak+Ezeo7IPocioxv4lmwWatbjVuKluWLotEingZFihrWLhpX4zxVNHhP+gjsBRjLLvk
	mjCOmuSE+3nAfdW5aX7rFbK8uTY6ZoqW5amm3RHRbvYeR3l9IP34+D1cn/5BnCP3H49j5/+rHKD
	+ydC+/0RtLaBJEQ7AgmaP1yQYcbEh9NKxr39JJC0RW8bUrjtA=
X-Received: by 2002:a05:6a20:2584:b0:3c3:2e2b:29ef with SMTP id adf61e73a8af0-3c3575df9dfmr6494504637.51.1784109383732;
        Wed, 15 Jul 2026 02:56:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:56:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Marcus Cooper <codekipper@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	u.kleine-koenig@baylibre.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 6/6] ASoC: sunxi: sun8i-codec-analog: Improve probe error handling
Date: Wed, 15 Jul 2026 16:55:25 +0700
Message-ID: <20260715095525.40668-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715095525.40668-1-phucduc.bui@gmail.com>
References: <20260715095525.40668-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Drop the redundant error message after devm_platform_ioremap_resource(),
which already reports failures, and use dev_err_probe() for regmap
initialization errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun8i-codec-analog.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec-analog.c b/sound/soc/sunxi/sun8i-codec-analog.c
index 2024e2b2553e..3335855c6311 100644
--- a/sound/soc/sunxi/sun8i-codec-analog.c
+++ b/sound/soc/sunxi/sun8i-codec-analog.c
@@ -822,16 +822,13 @@ static int sun8i_codec_analog_probe(struct platform_device *pdev)
 	void __iomem *base;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
-		dev_err(&pdev->dev, "Failed to map the registers\n");
+	if (IS_ERR(base))
 		return PTR_ERR(base);
-	}
 
 	regmap = sun8i_adda_pr_regmap_init(&pdev->dev, base);
-	if (IS_ERR(regmap)) {
-		dev_err(&pdev->dev, "Failed to create regmap\n");
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
+				     "Failed to create regmap\n");
 
 	return devm_snd_soc_register_component(&pdev->dev,
 					       &sun8i_codec_analog_cmpnt_drv,
-- 
2.43.0

