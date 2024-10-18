Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97855201267
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729267725; cv=none; b=liiBPhE6+w5rmEj0dRw4aXoZblXjvZeR5R0Cbm3b4/pBkrgotzU3E7scu3qanBlsQZkS4L5glKg1olH6YcHfQGgomMCuIQmIHZqH3NoIsApi+QztQ2HM2R3hjVdo25ZEY/JDDNbkdBY576lfUKtASm7xklJNxVNItjXDV1gflKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729267725; c=relaxed/simple;
	bh=67aMbvxMWj4JUgRz/oPNgALnr+5vJQ//wdiYguyXanM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WM/GZY8TfsknKnN6JUwWkqUm7SOjCbPAatAxwM4Inxoi+848h66QgsvoPRn2IhFfzBQjJaLr8x75YrBIWPtCHL1/QX8XTP6Fyuq/kQou4rNOZl+vZc9vkW4HR5DsvvJsBpgaWYW1UV6xoBRnpmddQEkESqziyKEpsvt96Pp6eRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gp8pthfL; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gp8pthfL"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2890f273296so1064136fac.2
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 09:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729267722; x=1729872522; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuiD2uDkps50GUExl36s+u/4uBbEmd5xbm83qX0a1SM=;
        b=Gp8pthfL3mUkTJq9Pv88RF5qI/lLVjfCj4iaBYFxhE3XLt6T/1FEqC3a27Iftjd6G4
         s7j3rjyD4TabZsB3++ha6sfe51yTIiK/wTKBMv6uKAZz+MehC4O/FFGx2s5Q1u+A0m1l
         0KXapyv7jffSjGgYAc86wCfZAdi7TKx7zZRg4HjcrVZT563H0cqBeF8RIBsjLXxWlxAT
         n8DIkbHvIgqum4MdX7dAW2vF3gAqPh5DOHxkokvl9LhaCKQdNIPeMqx5ETk3hcXgN2Xm
         bYQm+KwTJC7oyqi9zKqFn25s9niOZIohM+pg+jPwYKAHuidBRhjl6sruT3vW0kcTlQ+A
         tXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729267722; x=1729872522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuiD2uDkps50GUExl36s+u/4uBbEmd5xbm83qX0a1SM=;
        b=d6u3+4Ovh7SDmqDgVoMsWbgDzZN7m32+A3CSPtFWrAgpwhRewul1MCAcw9AoEgHQF+
         HK7n6w/4Vf+Ce+BXch9pNcQAb2fKwn0fk/dzfIADP2/16xQiL+mrCJ9Y90w4xn22aS+C
         FEOJ6FLrH/duLSuW0H2N63YPdekRygpIQ40KkwKzv33NOvo6twscbjdA3EG6Pg0ZVLg5
         be7mrspFcLZhHZd8FTqBZowb0VPzR9WcJqWDYWa+FS5H5rmjgvlNeAxpWA/IgkKgQ8Go
         9qNKL8c1RVjJJri4TLrcqOK5R5lSLQ6FBpnvYqwZw9mnD8xzSmJDqRC7IpsXNkmPPnWt
         M0Hg==
X-Gm-Message-State: AOJu0YyzmLmbKH1OC58A+PndsR+Pa0DDB0lLfoNF5fJHRY8naACjGxAd
	KSQLB3QveON2rRMoiHBEFxSgOi95PAd3eAZOLIwY489IUonDehFTvrBtQg==
X-Google-Smtp-Source: AGHT+IFXi/u7VPBRcfLS2sRmkr16DOy6F48nv95CHXp/+haDcFJoyk1DAULduRIKiVrDPKO0AjVb8Q==
X-Received: by 2002:a05:6870:ac28:b0:260:f43e:7d89 with SMTP id 586e51a60fabf-2892c29c666mr2368335fac.2.1729267722325;
        Fri, 18 Oct 2024 09:08:42 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2892afb01ebsm507350fac.50.2024.10.18.09.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:08:42 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/4] arm64: dts: allwinner: h700: Set cpusldo to always-on for RG35XX
Date: Fri, 18 Oct 2024 11:06:15 -0500
Message-ID: <20241018160617.157083-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018160617.157083-1-macroalpha82@gmail.com>
References: <20241018160617.157083-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Set the cpusldo regulator for the AXP717 to "regulator-always-on". Its
current functionality is still unknown as there are no schematics
available, however it was observed that upon reboot if this regulator
was disabled GPIO detection logic in the bootloader was inconsistent.
Keep the regulator powered on for now until it can be defined
correctly.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../allwinner/sun50i-h700-anbernic-rg35xx-2024.dts    | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index e2039fd76b3d..2896d51cec7d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -342,8 +342,17 @@ reg_boost: boost {
 				regulator-name = "boost";
 			};
 
+			/*
+			 * Regulator function is unknown, but reading
+			 * GPIO values in bootloader is inconsistent
+			 * on reboot if this is disabled. Setting to
+			 * default value from regulator OTP mem.
+			 */
 			reg_cpusldo: cpusldo {
-				/* unused */
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
 			};
 		};
 
-- 
2.43.0

