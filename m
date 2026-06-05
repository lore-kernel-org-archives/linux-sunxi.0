Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91404266A1
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Jun 2026 07:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643401; cv=none; b=ApEu5sb+QPhJYAnZPsS2i/S3e1bVvUo90GZXcJ71txJnahU8Fd+xFv9SGG3zbZ6L5XbTKBEAmxBhLPjBstiWUEnZbCt5bOG0EpYUzgHY424BW3Fw7q9yIJ9N5BeDo1H2ps+Fdi4DIiY30eZ2+Y9jRQsbIDV1jLRl1qdO0mzur78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643401; c=relaxed/simple;
	bh=cli46i4g+ZWhHfmQnyctvXCYw7h17mfnw626tvQL2Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TPH/QAN7cRpCc8m0j+KIpxqbVDKJbWXBjX0JxrNEmu+ZrPTclfWurD0z4Z9iuxGpXXvSkT5OewJt6fyq7kU64AElMIAtKOut/M62Xlh8wDl4zYW7jV3g8ramfezjGzcdy51SRW+K4a8LCoY2+x7mX0oopMxevJ+rI8BUWtnVLeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coEHjUbE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coEHjUbE"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef5146b56so1689897f8f.0
        for <linux-sunxi@lists.linux.dev>; Fri, 05 Jun 2026 00:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643398; x=1781248198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWQkWARQy+nWOamGOOMfZhOPV4ti0QdK7fq4o+3I26Y=;
        b=coEHjUbEOImw9/uN61cxlvd3DFtzMhQ7xSjQF/rBworOnDkGot9GZmtiTQN05Zhies
         Nrzh3tocvYMgwuicykSgjWY456PTbIuV+OWfGsW1QWEE+V/cwLF24mvAL1vnzaQaUa61
         KpygrST1X3rVoWlvkKrTURCQwd69UpDEScHA/phvY70hfUyE0UAtRaMlSWT/ZWO4EMnz
         Uj7k87/B7aUMrKcaBxxhc36Fwe+V5L3J8bmhYZmMgZshjlParK9PNtjfzd1i06lGgGL+
         OrLNTMXQs7jyr38CdSrW7stbzfj/zJr3gU4938n7W1SdfBD39Vzq9rjY0YkuAWrw88z3
         1wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643398; x=1781248198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cWQkWARQy+nWOamGOOMfZhOPV4ti0QdK7fq4o+3I26Y=;
        b=LdYjggHnLMGnTua5/GcO31yPhcf29phcqYZLkY2vMOu9HUabfV2H7W819NxKtrsO+w
         vJppkm3tO21SVzvCod8sHVm6BpjZLAs3RSdUb16AVgI9AMW4VWcyY4hgpvoKGFzaiweu
         Qnu+A8zeZH/liSYgbooTeoXfu78QbPsUnN2P3XWbTcwh9g8i/NkxK3Dy1ElKdo/p46vx
         4z0Uz/XFCewkieb3oAfHpVjyJw0R4XWMftcHkVbOuW+74z+V7bk34t1PVKu6fCgZ/STT
         GBFddHhF1ITQlKu3dzKkYQdC4wUnQXx9oOBkUy+zZPRzYVrPsgJGrWz9eOvEEFH0GAa5
         4cqA==
X-Forwarded-Encrypted: i=1; AFNElJ8zd6DU9XAfe85fDQfs2wzXSURMaCBXMNgtMJXuWzkbP43i8qSSS55b6riefvJ5ganNpGzDppLQet/BSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeyJTLObugM5M6zdqAhDT6YgnJ4jE+hSVKUc9cj4SQR8cFpE9t
	Ipm+/0F87JYazIQghkkq4phzRAP4t3Untj0Qs18c6UqoQO64JIVeZgTs
X-Gm-Gg: Acq92OFCpiGFSs2P6JWzKxBDgGMpbFma96lA/3NGt1KuFXZ82ddadh0WGATFm0iuFN+
	5T7qja0f45QcDGZduUNOuDtaef3T6YLEs7E7mJjebI+XEx57noZAb6ph3houUG8M6Pj7yEBmK0t
	cublFotIW/KAKKJYXOVQBB3l9B1YeHmv6Ev1ZIwpnC2aobpxBG+dzhjBIgtof88clgHWSLpa4sP
	slWiJ7yWPS0fwqWhfqN7DSv0+NyqyQfEIp7gtTO66Z5JeNJkM7AaPBXa/dj9bAC5UpJDu4JZatA
	AIwZ7FEnz0Tmsszx/I1c+wVQB3zNaIAFMxX1KUzKdEQIKS36SQaTbllN+vEy0vAELrBv8wTSB3F
	yrWHLtZOUt0sTTFOiKYjshEmo25WpYb+sD3DWcVnpouP18TsiYXuAygOhrOSMvW2OToPDHMaQZH
	vkKOyL4cSIgPcd62DiVBrNlIojMK6FcOcPLmu1AGKEBpV+MHMWSmrN9R479Fpdf2FQchhthQx7S
	OQGlvjaPrhF4KAbWu5aJw==
X-Received: by 2002:a05:6000:4802:b0:45e:f3b2:1228 with SMTP id ffacd0b85a97d-46032b611d3mr2196291f8f.3.1780643398206;
        Fri, 05 Jun 2026 00:09:58 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:09:57 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 1/7] arm64: defconfig: Enable Allwinner LRADC input driver
Date: Fri,  5 Jun 2026 09:09:15 +0200
Message-ID: <20260605070923.3045073-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Allwinner LRADC input driver as module to support buttons on Baijie
HelperBoard A133.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
- no changes
v3:
- new patch

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 96ce783f24e7..faf6d86d0555 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -479,6 +479,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_GPIO_POLLED=m
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
+CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_KEYBOARD_MTK_PMIC=m
 CONFIG_MOUSE_ELAN_I2C=m
-- 
2.54.0

