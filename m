Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E2B17D1
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Sep 2022 15:30:46 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id t14so8741131wrx.8
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Sep 2022 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=18ALGCD6WSmdQYtbgKgYJ3c/Y319JyrAAYBhTvLvvok=;
        b=D+lIKJTJ5gmuLshP9pZR7/p9Uq3yXYg4c6fW1hSumSgSCwDmr/fcsKGBJJYtzoWVcF
         TN92NA+w2VWWby8boBIRrC14bsNy6GYJyUPzlPtxWzS4vdR7pAtld7jVe9UKiyn/T3n0
         mnFsqq4rRCunuO52qB/6Rs/YrSV+UibGc8pmWPOntrv5gMbhCfkfgWHX4dCR8zLDaqL9
         kCfQSPl/94cmjytUnDrr4Dls+czbEXkNWUC73gjbfe1dWCc98c4xtUZIa7MxCZu8jtdz
         teAm6/fXX6x/DcjovAjmyj/7jszu1EpgLa2cmsO0eHBSZ2RJFDtT1FFVcEwih0SifB3g
         3E2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=18ALGCD6WSmdQYtbgKgYJ3c/Y319JyrAAYBhTvLvvok=;
        b=RUWOtRj75YHVZvAVqovmJiR5TltTvcYmaDQo11Hdr8vwVunu9ho8UkAqYMPKpT+pMD
         bI6fEs2ZGThXDCE1TX24RFqDpAsVb6I0HLV2jJLLVc/e5fL6PO/NMUeJSMFWirmYHRfI
         /APIivqHAbW2ir4zj3g/jdLMhHYYaGIoWeKojLC7LcUWs0CHJnSZlgOsJiXtsug7uE9H
         SRW4/kh58AdbIQCs/2ucHkgaqbEW6BsDziNllJb6CtNVvMWjuIHKKAglej92mFMjypE3
         7cQfGd4grQkmFRyrWcsuuDREaZ2J7f+OmBTFsJ95QnzBUZUNnNRi8HTYZbzI9ADV8Ttr
         /pMA==
X-Gm-Message-State: ACgBeo2+gwV3snOyvTHxKieOXahkVTUeAGqSKjN/o9uBowJ+23DZ5mYi
	SFryHTzBq+DiYyNkAwWqJ9g=
X-Google-Smtp-Source: AA6agR6P/RoJFPCp99aXsrvNKO/CW4Xn7PpfrGRr103Jx3gdD14r4PVNgrMIKUUt26sNFdyw2C87+w==
X-Received: by 2002:a5d:608d:0:b0:228:d095:4a15 with SMTP id w13-20020a5d608d000000b00228d0954a15mr3792578wrt.499.1662478244524;
        Tue, 06 Sep 2022 08:30:44 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c22d800b003a6125562e1sm14922731wmg.46.2022.09.06.08.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 08:30:43 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v4 5/5] arm64: dts: allwinner: beelink-gs1: Enable GPU OPP
Date: Tue,  6 Sep 2022 17:30:34 +0200
Message-Id: <20220906153034.153321-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906153034.153321-1-peron.clem@gmail.com>
References: <20220906153034.153321-1-peron.clem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable GPU OPP table for Beelink GS1.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 6249e9e02928..9ec49ac2f6fd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
-- 
2.34.1

