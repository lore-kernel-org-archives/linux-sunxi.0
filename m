Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF6EDF76
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Jul 2026 00:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783037233; cv=none; b=Z7q+bxND5KeqflOsYt2P5s2eX/vMalprKk9JUZAAd6TIvuiQTu9fKbSTYSdFgmqgANRTP7Qk8aCytkCGgq+SdUeMlrshdQpQzyhRQg+DvvYADfyK1J0jtWCwuAmw1FMBjnuz+902TtOUqDthj4APPg4cXKwska/3HRoHhC3h3Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783037233; c=relaxed/simple;
	bh=Yq0MUliYbLm6gjsyJNyBrL0lWk6bgalG+E+xG1Xl7sM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NVqdQ9rZCNNw8Ztv+J4MpxUcBaizuLMxXv3/0MCo5tcH/kJZ41b62HM+qF08KMEmU4FLNYNCFd/hozgJEDCz2yBkY75n9HlRotX4tDIcGnVsSK4EH5mWizlIfZa870Wg630GamRWBRBkV4GbdzLA9c1Sj4CLwj3gH3zUIQnMzCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yfn0UL3o; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yfn0UL3o"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e663c828dso725785a.0
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 17:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783037231; x=1783642031; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yq0MUliYbLm6gjsyJNyBrL0lWk6bgalG+E+xG1Xl7sM=;
        b=Yfn0UL3oCqvXMSgdDzNywwCQYUYVpVZN1BpdPwP09YTfbqqJA8qvTuSNGojZkroNun
         MR3i635Ru/IDPmGrwKYzXZZRl1Bi56htwiFZyx1PMp+lLNCFfUO5/I5iNMUqaOT+l/a4
         3z/MXR45zup6or6UZxPohFP7MW68rk+ApJgzCYuyteoTwGGhkshXIzL4Hzk7YXyuqah9
         FuYhyb5ABICke/TpIZNWWlg7h9AO2AAkNWsf5PWMe+GuwccPRmndI6EmuuMc9lElLTJU
         b5s52Z+A13othp8WJKnbYAKmb9/XEbwWLXABQk018My+sv7yBx57J8BZmh815tgz+Y5A
         J7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783037231; x=1783642031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yq0MUliYbLm6gjsyJNyBrL0lWk6bgalG+E+xG1Xl7sM=;
        b=W/J9R7dekgQaJIQiJxCKQ+ak/szpT24kAeUfwSW+NkIe5EF5mQWKVWolqPyYGgqfu3
         Oxca92QHaOLs/B0TIsi1FsKPLvhFNtqIhzPS/UL/NxBKlz11578mqep87KzxewcmDrIN
         i6xZHQLD24A/VyqEwv18WuYd1Tz4VoTIzme8LVHn+fjWNO5ENU3mhYaZqAF7MxYyFSZV
         hEG0ZBdqUHZrAcnrwYPQhhJSma28j8nXikwvv/06KdbPZ+oLZ1+zCwCXcguqJa7vHFzQ
         PwM4aFV6ncXKNEHIc/f4s+xwVg5cg3nfS7HPpchmtG9AO/xnwJQlaaRKjBZfRxWNm7O7
         J/HA==
X-Forwarded-Encrypted: i=1; AFNElJ+lP9Dgh6B6MobcZNvEg2y292skvOqULAbmjAhsxIC3820HNjWVhDA9c7pgPd8UgptS0EELlugrkWnIpw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNhPgG4QteZsRBXVs4sZlY645l79QA0hns6cJVQq/Xchqsguds
	Wi3Cp7xLWXWRJyGY3pm6GFKr2dP1/A11R9Wzhqo8sYfppxyi+xzr2OJq
X-Gm-Gg: AfdE7cliiGmn6boI480oxP/iPWG1Vd/rTA0u3OGjxsur+PeSQKn8Fg0lv9ffZqjYhHS
	83fae2RM5RhuRPxTOzTeIoEJ6ZIyj53uDS4pZPDrek8nw7aVtvN7KgbqNZe13QFzh6Ltb7DVadC
	qEboaMQIxSFeB6qrmDUBiMowaoyVnFe9INH8Q8Jif8EkNsydSn1U5IdfUEjNh40N5LKAULEsfDw
	jJfcdT/8lM8u4McokHTxnQGzDe/FXeC1E/NzIQK8md42hWoBj4F4JjugJ7TabeMhy4bZwx3zsyK
	AAEWnq1cYKiPRtciHdaAYD/nXhHOHx9RC799GaYMh5fkDXqUjUfvB3CXBqoUhsUY2ERsni/50KO
	CMXmRYaKnklfM6Z2RG8utlqyVEUPL2Zol8+khBcQz2pJyU+NH2/S9flsYWkewjZosyu58YUop7z
	0NjiICoqgeFJzrn5LqnohQl/WIZ2XIu87peaAOc7O+KBHw0lAAt2Bcowyd4uH+
X-Received: by 2002:a05:620a:4044:b0:92e:650f:c392 with SMTP id af79cd13be357-92e8b275355mr264263485a.17.1783037231297;
        Thu, 02 Jul 2026 17:07:11 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90cbd6c9sm12190085a.33.2026.07.02.17.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 17:07:10 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Yangtao Li <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC PATCH 0/9] pinctrl: sunxi: Allwinner A733 support
Date: Thu,  2 Jul 2026 20:07:08 -0400
Message-ID: <20260703000708.1238530-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre,

In case it helps when you next spin this series: these patches have
been part of my local A733 boot stack on a Radxa Cubie A7S for a
while now. UART console, MMC, LEDs and USB all sit on top of them
here and I have seen no problems attributable to the pinctrl driver.
Happy to turn around tests on real hardware whenever a v2 shows up,
or to run anything specific in the meantime.

Testing here is AI-assisted (Claude Code).

Thanks,
Enzo
