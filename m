Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BD21353F2
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 17:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713114273; cv=none; b=p4oj7lxlsXmAnPeetShbMSzSfHoehTOaNqZaoWY6ILE7UsvZfLdO4aIrSz4a0DFP0Gl0iZ+kcu8AfWLKpp1BeUVWkm4Hf17ovSEt8uEERTLhbmkt1HOaWN8rd15Y/kP+E4/U3dCbG1gwkBf2EK5Nh5uc8wP4yA/KI9epCjC9wSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713114273; c=relaxed/simple;
	bh=KDEOtLvgj0Gs+rRWctvmMVAUHK65DzeB1xCcVbmAjag=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NOJejiuOkDW8FNKF/BgaS4vb5aYcx6OQYjXdgu9AG7GMzqXBtGtGe44pbChz2BXDjkf9mrSiVThzcuSoL4K1oV853PPBy2ufLpzXyBax4BxXa6BkE2sMJ2HKy+eBtZs0zFDGLQT59BlDumRgDQDw/oYs1YrEnQQxp64IVxn71fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nR/mNxvI; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nR/mNxvI"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5aa2a74c238so2024953eaf.3
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 10:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713114270; x=1713719070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nEG6ZdeQXXzDaGLwOjwiQASB3UlmfQSpzsMzWbm05Uw=;
        b=nR/mNxvIoMfX7MrOPq4coK9PtOBhp7G1OcjEu1ou1/OkIgvZbY2I/7kLQTpMmOth5w
         jm0TTHeX69iZIAhbuUwgkripmxIkgKGp69Xd91oaJuKQSogBtTdn8mHvt1ndp1s4jqQz
         gfchMa4/Bd4aIjy3FAkla3snoyrFkKgAwSJo2HvBhBBcZDXS4oKAF+Ib/6KGwN0KJ9r4
         pLJpm0+yDFVeKCvbTfWwmX1NS1LFHasvm4+Zj3AK3J2r8zygA0B/J14uvixCe5zZD49Y
         pe+uJEuXChrv1TmSHgsiVJbsWuamQn9x4T7WtSxA1Z+QwZCWlq7gI/rSvXBLz1eCE7EM
         H/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713114270; x=1713719070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nEG6ZdeQXXzDaGLwOjwiQASB3UlmfQSpzsMzWbm05Uw=;
        b=EMRlDniU+x4nSq32OE9zMKIiLFhJRuinPYdOHW0SU0Hs2PeftDixdS72IjoLcUkLsf
         JBYb9xsq294QSoC67CY37wA/MDRiBnqXduFMlE3YqE7rWU17Iw62TFRmGoKGsBWRrWMs
         qJEtq7F+oKEuX9u9ZH1Fut9Y8g00+TqP9kTMNF21W7JetJSivomX1O7ZR/qxfAll43N5
         +jK10vus6G9ALa7hIlKvg8FJa14G4UvFGCRWVfWc6FcNrqhvbnEtUMdnIa2XdUfZ2f8B
         eRUwz84LOT1yZcbZDWN1DsZhbNo2xRAEiXzB/U1f3IsExYOSInL3aZDxEL55a5JH02mZ
         TKug==
X-Gm-Message-State: AOJu0Yy+xofP2sDErfvd0q5JuMFA0YSc5m/6ocY86zagFW9/BSnv5Uby
	GHpWelSQkTJFQL+KcEVDl/ZI1IpRYy19XnFFjFCosS7xvAhqpQ7Nwn1F/g==
X-Google-Smtp-Source: AGHT+IF7sVlNh3TJf1SIwxZWr0CkMVJdgNNAJu9f0fI2N2s1HihoD7giU//FZLDClk1FSOhkMdicwg==
X-Received: by 2002:a05:6870:f212:b0:22e:d463:3b53 with SMTP id t18-20020a056870f21200b0022ed4633b53mr9887531oao.11.1713114270594;
        Sun, 14 Apr 2024 10:04:30 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id mv5-20020a056871d04500b002338e2146f8sm1585305oac.17.2024.04.14.10.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 10:04:30 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh@kernel.org,
	ryan@testtoast.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/2] Allwinner H616 NMI Controller
Date: Sun, 14 Apr 2024 12:04:22 -0500
Message-Id: <20240414170424.614921-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Allwinner H616 NMI controller, which appears to be
common IP with previous generations of the NMI. The NMI is required to
support interrupts from the PMIC among other functions.

Chris Morgan (2):
  dt-bindings: irq: sun7i-nmi: Add binding for the H616 NMI controller
  arm64: dts: allwinner: h616: Add NMI device node

 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml | 3 +++
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi           | 9 +++++++++
 2 files changed, 12 insertions(+)

-- 
2.34.1

