Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C21172773
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 17:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713373471; cv=none; b=qS4B4ulvlPeAUlP5nfuKZi5rOUd8uypH5bpcIO4w6YnvEVD+Ott0UrVPs+ZhonKEcgA+EJmqCl2JeEU5Vd/c/ynl7oTMWPYq8i1a8fdCbQgBWfoT8+QrXMzhXUr3wDxpx24Z7Bz1iZPc9pJ8YYLDak2RzakL+9CzhsBW64hwjxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713373471; c=relaxed/simple;
	bh=fIKOLKWTxB083m3S7ogllEU+AR/b1bZP165v0nLJgyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xvoba+ZgjADnlfvOypOnn8GORqJe9rWz6ifkd0vJcxen7VgVLYorEmL17StqANROW2UCY8vvXd/tY9srdiyLfTQW8VpYbTjZrrfc5/4Fkge7zCM5BD94Cj7I995Wu534AhZvA+d3ldnNi9SpxALKbfMQvo7vHsiS5pC+fF+YRnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISqncuzB; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISqncuzB"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6ebb815f688so351262a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 10:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713373469; x=1713978269; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vnDj8AkYyHP5FgPYgPq1dtF6Gy+NT5+5GBKZUHlBHno=;
        b=ISqncuzBYjOYAmsU0VdJYtkQzaw5wCxtsNG+RAXubObaoSFrLL/VRC/J+7zgYrF2Yt
         L8+e9tSQ3J7NeeTEDj0YUsVtRoRb6kr8PdWv+6h1N9Ig6f7+PpMSnAV4pWs8n73o43/9
         SRDQjlEgUp76MbcGRnAeabEJ1KmHoZP9Ec5Bn7pDbJZ23rxjKUCSyakwkqLh3DE3FoOv
         j/NIjQV9rRbTjP7RyakISTuHwvuKNlvyxGhtD5f9fLn4rp4FFeCpUOLdeO75YXvb9in0
         Mr/dKi5XsHK382ilueZhkPyJwJ5ulMjJvVPQWig85DOOeC0LitQKaUo8FxZfalzdmC4a
         9SAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713373469; x=1713978269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnDj8AkYyHP5FgPYgPq1dtF6Gy+NT5+5GBKZUHlBHno=;
        b=Q+Dg5/58UNYSs8BYkWTzi9Gp6opDoJjYHlygLw0YY9/3vYxF+8n3dZT5/tqaZ3QSzu
         m4kBbZHBGiap0de+IMZhhykFCtEJJkLFHgc7GCKUCccm9dbK1SS8oJGkF6nCVv0XkPQ9
         l+tEErLpSb2mKSQ3tItKztmx/rZYRUykev3kccZ0o01ObNleIIm9eGSI627aP6R6Le5g
         3ZqsbBQ7Ek6HYUe82EUYLct6l+Ks9XC5vYlhPwxv+ICL6PyrWCmnsZaDSFfUi9dQzBas
         nSdO33mHHVO32qQeSZ/+f4TUgKQH+W9jrvkEIMTQbzPcTTLLdGY4FWIBxTzjOjTeoJn3
         AD2Q==
X-Gm-Message-State: AOJu0YxzSncOo88iEHcGx65wkrU91WDFpc0wfq0ub0IrmJsjXPEScLin
	/7hL9/BGS7MhqU+1p3uPRUuwBqW0JsSz/uaREXzwKiX8oVZmkxiRTccSXw==
X-Google-Smtp-Source: AGHT+IGUEpdZ43OwhjDnGVsGC3xESlw9v3kYAOkMg+9vvhbiEUXF9l2XlN9MhwrFlDCAjBjR+PS8SQ==
X-Received: by 2002:a05:6830:18d1:b0:6eb:7b64:e5c1 with SMTP id v17-20020a05683018d100b006eb7b64e5c1mr51443ote.18.1713373469336;
        Wed, 17 Apr 2024 10:04:29 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id k20-20020a056830151400b006eb77e42ff5sm1721615otp.26.2024.04.17.10.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 10:04:29 -0700 (PDT)
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
Subject: [PATCH 0/3] Add GPADC for Allwinner H616
Date: Wed, 17 Apr 2024 12:04:20 -0500
Message-Id: <20240417170423.20640-1-macroalpha82@gmail.com>
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
for the Allwinner H616 SoC.

Chris Morgan (3):
  clk: sunxi-ng: h616: Add clock/reset for GPADC
  dt-bindings: iio: adc: Add GPADC for Allwinner H616
  arm64: dts: allwinner: h616: Add GPADC device node

 .../bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml   |  9 +++++++--
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi        | 11 +++++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c                |  5 +++++
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h                |  2 +-
 include/dt-bindings/clock/sun50i-h616-ccu.h           |  1 +
 include/dt-bindings/reset/sun50i-h616-ccu.h           |  1 +
 6 files changed, 26 insertions(+), 3 deletions(-)

--
2.34.1

