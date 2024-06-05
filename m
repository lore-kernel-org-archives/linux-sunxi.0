Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5493B38396
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 17:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717608056; cv=none; b=baliC2+zQifswpi95qKQv5OWkhsKWRfn/l+gQGJkdrMLMR3k/zEVn2gJz371q4MGmeSBBd3j6AievhsV/AXNxvCKp+pQLvlvTNmwCQv/Qfgb26Hko+Laz8fBcJCGQAqpPy/HgZ1LAePlXmyIhJ5ikRTcMiE+vNNLp8NIGx2JMNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717608056; c=relaxed/simple;
	bh=NOnqln06S+MFv80mqKTSNLI3wJ74vF+Bg3os30TxL/k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cwRozkESmHiteelrTgb6ifHTNQmjs8rcjuSRcz0RTV+2QBxuVK9HIKKh8HYdP8Z20GPVaYh7y4SZrG26d1kcx7jrf9WrxjzijQYuZ+5+ykrmL/JclMitJ4o2Hbl1HZGTnMt3BQuCG9+W+dNNYScVPWh2QUorKX5JIh3pf4x5RqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIbIgadX; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIbIgadX"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5ba18126a3bso1107eaf.1
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 10:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717608054; x=1718212854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4IEr/gSqoWImb//qZWKO/ZZ3zZM5bGTPdO0tMABh1EM=;
        b=XIbIgadXJFVSB2isYji0jasOGJx5gUaA5IhK0i66Fk6JeviqdjVRc4Jm+b+8hmLMRq
         1Mis+5DqfWaLJiG7gSa/jimXlAzmZrd7TbAe/89M4xUPzaqM9mKpiDEzC5Ma8d8pkskb
         BNNda0j6s4hMdsVEXp1TJ5MoRi2ElA3X+Px+QWFuUbEHWtbec1DPz0I7TuuJRtg/2Owo
         OhCuXJ/4xPUhM9hCQwOKhv+u7433xgqxbOPiJtT3JfE0CHH3gS7QqABApHZF1qX+96tJ
         vOunbhBzr+7/oVmvBmobJkLHEJKwH+vnyo2SHIzHOxxS27sk+FcSFDfCHdAQY+UJSca0
         FoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717608054; x=1718212854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IEr/gSqoWImb//qZWKO/ZZ3zZM5bGTPdO0tMABh1EM=;
        b=LN1SL00oE9BbCg52MGq+NJSrFZj8iufAvimbkrAkBjaqPZEuORY8Fg9p0M9+wPiVjX
         pXh02156vP2ZLCbyo24B5ivJ/pwsRoWfHxTsTXV5icfXNXo/MKcw9l2jJRo3TaBmEVr8
         7uROnN/2Brr688zswKdc77777FTqC6ozPBJpOqMEc7+KlNPz4bjRqOA/m5uB0eI4RhuB
         6cAaTRAH7fCh+Jg0dpslJxdIxJHIg+SiwfK4HIOQcU2MHDXdk6u0fNgaLF/ZTlC63L+E
         oQcEjJYlcPN3455zH058tjO09DfjrQefTW+yZEQLTlzQkFsYgAaB+r/vUzYo2iW8rXSH
         qDhw==
X-Gm-Message-State: AOJu0YyfNjWlpR+LTOHuo1c9Hi5lDgJy72NPgZ/TFGHvtOK7ueUeTs1w
	52Itkn0t/qP1Jon3MdNUoOvLwBsttS1UwcCFLM902WlzSqt8JTqMoLhmaw==
X-Google-Smtp-Source: AGHT+IGcFeJqYdOy5bu1wSd8nRMa9fxc9uZpmjYp/qUhUyDXktoAoWMya44tJdchDX2USHtsbeQNCw==
X-Received: by 2002:a05:6820:161e:b0:5b9:89d9:c5ef with SMTP id 006d021491bc7-5ba91323287mr207128eaf.0.1717608054271;
        Wed, 05 Jun 2024 10:20:54 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ba72cb44f4sm586124eaf.40.2024.06.05.10.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 10:20:53 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	p.zabel@pengutronix.de,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 0/4] Add GPADC for Allwinner H616
Date: Wed,  5 Jun 2024 12:20:45 -0500
Message-Id: <20240605172049.231108-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the general purpose analog-to-digital converter (GPADC)
for the Allwinner H616 SoC to support the ADC joysticks as found on the
Anbernic RG35XX-H.

Changes since V1:
 - Split dt-binding include additions to a separate patch.
 - Removed patch adding compatible string as it was already upstreamed.
 - Added patch to add the adc-joystick function to the RG35XX-H.

Chris Morgan (4):
  dt-bindings: clock: sun50i-h616-ccu: Add GPADC clocks
  clk: sunxi-ng: h616: Add clock/reset for GPADC
  arm64: dts: allwinner: h616: Add GPADC device node
  arm64: dts: allwinner: anbernic-rg35xx-h: Add ADC joysticks

 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 11 +++
 .../sun50i-h700-anbernic-rg35xx-h.dts         | 79 +++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c        |  5 ++
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h        |  2 +-
 include/dt-bindings/clock/sun50i-h616-ccu.h   |  1 +
 include/dt-bindings/reset/sun50i-h616-ccu.h   |  1 +
 6 files changed, 98 insertions(+), 1 deletion(-)

-- 
2.34.1

