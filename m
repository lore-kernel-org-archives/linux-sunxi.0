Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E8B215196
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Feb 2025 16:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684864; cv=none; b=BQRN94fxF5VcX/ltECKXKiy9y+dF9ivyOK1jYLWWnWMrDf9/xSNrZWAGzzdijfoYsq9cv2JBMkDYGonmvi5AtEBydM+2nyLHvvQUyYtBYaNj0WVlJLGuv3D60Kqm5gzpji6GBbHC4Ru5wYLHISzX7lYMViWHCs2vyptbLEWHkfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684864; c=relaxed/simple;
	bh=7weosOB2tkJzFFCK1j2kvlQUUXPViwlIjKFLoG1vu/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=seTZI+S6L2TkU/8ZUJNJZbYVPvNDSonalxTAp998m+HXrHKRqbqEQ3f2gVWa1d7tYrXvd/KOPlXZNxqQxMcggKJGPebSqLJEcGo2cUp3seruHEvDLemqQl2yWyrEdOkbIFTvq9Uv81q9Awow2lXjhkYBSDgfhDKRGK9C8YX4Zas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhWwA/8K; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhWwA/8K"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3eba50d6da7so1622855b6e.2
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Feb 2025 08:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738684862; x=1739289662; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rSvVS0xRSmkwB2ilC6LIMN2F2AJg2DEhA8U1xiK1AM=;
        b=PhWwA/8Ku1mvHPBFzRGksTb9XCfQJ9GgUFcshB9qd3xHpakGTk6EJ3pce5i+pZ+T8V
         ivRrd66m9lefY0Z6q85xplpDHhod0SVkv/S0TdvgfomkjqtingZC6fLtot3P9Jgbx9Wj
         RMiNsNBRANpAGRHiGFmrjC+tVI/+Hh6OpUXZH6PtbNN37A7GlVSCNEgTKYtEVsElvK44
         AJr3Y806kmxFcGYVRS619BqwW061grLAILch7g8tG5O4GukJqQ7t8rpKI4h0ij/o+Acb
         vEtlKpYyCqG1u6CFNOT7H8T9w2C9gXoc5gt4s9b8ejY8hTQfXbXBShrDxAF58lb/iVfm
         kC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738684862; x=1739289662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rSvVS0xRSmkwB2ilC6LIMN2F2AJg2DEhA8U1xiK1AM=;
        b=R5VJuuuOpp90Kj/th7Q+IFrmEl6cv3ltNkBMFSSuz8SZF3ez4mDzceEQoWy1HPzAsq
         HcHk2R9SGFkk+y2Vh5y0z30VDc9C0WQbLXW/hNM7vrnvzeFI0xlEJrlHLBqUZOiBnstZ
         bkotQtgscIDiZ6hqQ05D/8LKDvj+S7vMUXtfheVaNuNrwzhusX+229B739hd/aCRVAIo
         t2tw42DJPXXGmYCownB3BS5DAweI2lOr6+c5HlFLaDeUpJFMEmnqI3L9PuQQLFW6NR6/
         g3HUjEVUQHSqQcTESzo2sy+ClnwPnTNVTrnoyg4n5Iovvvse2/KTO2pWiGevBvO7GnZQ
         wX/w==
X-Gm-Message-State: AOJu0YzJJq6s40iwZZQll/VMfYn7s2C7a/DIwv/1QvPc+RttcwYGQI85
	OUMp8A9zTIY6qvci7k0OKS8Qdd4qfJVtbrj0m4S/tp4shAE2pdW5AtS5qQ==
X-Gm-Gg: ASbGnctw/nJgSIMPXxWi1fcK/UaoZLeNhXh/V+LeBBjsPoOgFDFkSUCOrcpOICYGOCU
	/K2y923SVlQSBsHce2tBXGu7bciLRt2aH6zutE4o8jIeJOaMYgBSMzBBP2socN35uChHb8GKliS
	1fqAi3t3QEgWY2iau5V4D/phjYjEwYB2EjE4T6rHmra/Oo0EWvOS0tKmVEkJeCSNKQmjcBdBuFv
	i9EAzsxJPoXbcDx74+sh2GsJ/fVp8YnCnrly6bFvvTkKU/B7CFx9uW9psaRTtnuHklGIPKySyXF
	Fv5aE4j6VIezWr6Xx7ImxckebuCrD4v9XeI=
X-Google-Smtp-Source: AGHT+IE3z8YgAXuefr7n/D2BdGgHaUpfeLviUWLi9pX/f/gVplrK/fZcFaRQf6HzqmNZD0k+ePy/Aw==
X-Received: by 2002:a05:6808:3319:b0:3e6:63bb:ed4e with SMTP id 5614622812f47-3f323b3d227mr17390749b6e.27.1738684862198;
        Tue, 04 Feb 2025 08:01:02 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:f8ca:b029:fcc5:5836])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f33365be86sm3039570b6e.31.2025.02.04.08.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 08:01:01 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 4/4] arm64: dts: allwinner: rg35xx: Add no-thermistor property for battery
Date: Tue,  4 Feb 2025 09:58:34 -0600
Message-ID: <20250204155835.161973-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204155835.161973-1-macroalpha82@gmail.com>
References: <20250204155835.161973-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the property of x-powers,no-thermistor for the battery of the
Anbernic RG35XX series of H700 devices.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index a231abf1684a..0c89ccc662a2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -237,6 +237,7 @@ axp_adc: adc {
 		battery_power: battery-power {
 			compatible = "x-powers,axp717-battery-power-supply";
 			monitored-battery = <&battery>;
+			x-powers,no-thermistor;
 		};
 
 		regulators {
-- 
2.43.0

