Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793666519;
	b=UPN7iJEcIjIO1Mp7SoB0zjijCIMVAsk2I+nimQ+J9tJJkBGh0gkweVUrFRpYkCXz8xMa
	 Az99wgKeKjz6nPoRjMe3EtlMFyGVYpQi2jp47LXjGBpWvWARx7t4e2bDoAta7x6HJY5Xs
	 0E27TbHIdkij3zB5QNR/L2QT/XJ2Qw7l9Uu7xWjl6WsJuGtTTUCrW2/6tnt+jAeKxR4ZI
	 RtOPkuNcYxRqJPo3D6LIDWCKT96HkWZnDkQj9kDO2zU3yUYOLrkjghN9h52jdWJBSAFCt
	 7a7uzlCSwEqhb0BdL31CThIk8FxHKzZ7iyGkC9/8qBdngpAFpkho4uIQq+jGmC2jMwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793666519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Vh/cvDInRTV2ogz1411cOMX/5XEmrB74tytYBj9+zVQ=;
	b=VJNCB16CPZYopnCDfus8UkEZ1l7cZR3esRrRkoP1XbO7O7OBoJgXCpCrUu//KZf4udtf
	 ihxHOngbOIar6nMPlh5SiCrRhCvPH8g6No9/R0DkuRZWrPABwE+F4L1HnxNAjDWX1BdXD
	 nxZ3VYebcC612KF8mtxArLbMzNE+XHRc+C5q/FDl9wv9QFX+G8SR3SPbzIgmhE7OSgYc6
	 6FmKgZCSGo03XuVFk53dSD4wxcxR0XYohuSz3Fj7Mmp0Fd3lr8M8tVVlCZAv5LYtVyK1r
	 I6dd4siiMQj3ME79GAUNVHYTl9g3jFScGDz41h9Unidxarwsp7EJ438tFrzgRe/iHdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6OHb+dB;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881E4606A32D
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 00:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 881E4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6OHb+dB
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-854e904005cso108706a34.1
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 16:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793666518; x=1794271318; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vh/cvDInRTV2ogz1411cOMX/5XEmrB74tytYBj9+zVQ=;
        b=Q6OHb+dBquUavVqRaPwcHgAukPfrr3eQ7xPfJWzT9K2El1BxYBpmdshdpO3yXHDnOb
         Ex51N1SXltTMHQ41XLjCvH00/CcnUzeMNfosAUbdkHsiWGYkgK6R59kS+8uwYYZ4rw8+
         +NuJFIH61N1fskTMmUv5oQhHGpxmaXCGN/jRlNfQYF41JAxtNlGeRRSRya89IYldQL1z
         olKXH9yfqUjL8MCyexmHVETigvaNtdEZaeaO5ZYoLcq+WPpfQuDzQBBlrp4CPARfYLsR
         SHLuVoqEm0C1094GXF6srSIvcfmE+LVw+sIPQ0jrsUZCa95LkYeNrxiYnMxe3cL/3unj
         llYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793666518; x=1794271318;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vh/cvDInRTV2ogz1411cOMX/5XEmrB74tytYBj9+zVQ=;
        b=e1zvEWN36Tbh6nzq74uiksslpOEKXEWzFJbhuvn6IPV3kQ+2qpifIGg8BxrPkKEzzr
         b+FoSzonW68C8s7rbBlvRtki8CN5/S56k6USVKTWyB05NYhjahfO6Ln5UkY4FkmejjKj
         nJPsEU8LAIwLvDY7dWBy6jGcRfFTZibnX9J1F/SX4QbrRElvNghxQ6y+Nn/21W2X6Mxo
         9fbfDCeoeoij2dQKFug92KYFmNk6iNa3X++lBUmdH9p0C0oc3ajFv3m8PsEu++fK61HD
         aA7XJbWTW2fWIxDxqABI52+1IV4Yx7admI7LEPAHjLO5MI/gRGX1R7BfqVmpmQxaycFw
         iJuw==
X-Forwarded-Encrypted: i=1; AKwUvBx/XgbNWVVgh+5g4RY7GWBFTa2cnsowWvrmSJRtQp/ryR/eYhqR2bNL/raLdnRGhhbZuSaCuo7aBw+9GQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJaSKvq0Wl9685KYldl7qoPn5WoOhp5u1FNAhPAsyTIq8U6BBCK
	YGrRdjUl3kEp9JkUf6/rAVCAbLYNLFHs8RUAivD/6R278F3NKTSOU1K0
X-Gm-Gg: AYBFou3/rdIaMMuVeXgl7PBw9PQYmw1WtJzihSrY9pzM1ZgekTyH34FTUOmvgrnryMB
	G/2pzS+lOyKZEOiljH0baTqDM7PY+GgsDRnAGXwIfbqokfLgqr9detudkz/RBeQ6BAMXEf6ldCZ
	8ZyVKbi7lJP8QY5nIuG87FNWUyKzZU4LztkpxVT0Rtes4JW9NHA7tob8SLHJ72p9+I8Mm1fCi2u
	TERXvomz1GWubbknlyHDExmYamq5CSfqK3KmnseKRWzTpmAMOPqs04PX1UnZ63qJFpUmyS6dUaD
	yLKdEkI+3oEnOTaUsAsGmp9VlbAL9lqIZTs+Xn/rCbLRJNqrs4t+UskV2k/yeZxQ1bw98pFMLS+
	L/dIdKIwSxuJRGURKZh7aR3+s0sN0e5h+/mE5+ibUPwbRM+dcX1bKL0TAfukMXkau4zp7UgcElq
	TIL5XN4deL1NrrfS7PmuDcjk1ofuxlkbx2+4rz3KSRzkCWaViPHd7oXAi1W/kfbI5IqHvjis+HG
	wbitQkwqa3bLYn/j6AA6eJ3x1Tb4ckt2TNKjXqBd2c1ErpTaGYUh3gpuE123E408GyWNT+QCSTr
	CHYNYlBueEViQfS5F3YIgoVyJIg/fphDXe/8H9xS6jN/bSA7mCf/C3UtYN78OZztRYsP1v9BPW9
	F82rV
X-Received: by 2002:a05:6808:6f82:b0:564:57c3:2b28 with SMTP id 5614622812f47-56457c32c1emr1301058b6e.8.1793666518415;
        Mon, 02 Nov 2026 16:41:58 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56523cdd0ffsm388473b6e.8.2026.11.02.16.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 16:41:57 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: krzk@kernel.org
Cc: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH] dt-bindings: mmc: describe the Allwinner A733 eMMC controller
Date: Mon,  2 Nov 2026 19:41:55 -0500
Message-ID: <20261103-a733-mmc3-withdraw-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102-steady-grateful-chimera-e2363a@quoll>
References: <20261031020640-263f7b05-a7s-mmc-binding@gmail.com> <20261102-steady-grateful-chimera-e2363a@quoll>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

On Mon, Nov 02, 2026 at 08:27:19AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Oct 30, 2026 at 10:26:47PM -0400, Enzo Adriano wrote:
>> AI assistance: Codex:gpt-6-astra.
>
> Drop, we do not advertise slop companies anymore.
>
>>
>> Assisted-by: LLM
> Drop

Will do, here and in my other patches.

>> This binding is a separate prerequisite for the disabled MMC3 node in
>
> How this can be a separate prerequisite? Binding without user is not a
> prerequisite.

You're right, it isn't. It should not have been posted apart from its
user.

>> the A733 DT v2. It does not add a sunxi-mmc driver match or claim an
>> operational eMMC path.
>
> Hm? Why?

Because I can't test one. None of my three Cubie A7S boards detects an
eMMC, and their vendor device trees leave this controller disabled.

[...]

>> prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
>
> So this cannot really be tested.

Agreed. Those IDs came from my local tree and are no use to anyone else.

I'm withdrawing this patch. André, you asked for the other MMC
controllers because the IP is the same, but the manual documents a
different descriptor layout for SMHC3 (A733 User Manual v1.00, tables
11-3 to 11-6), and I have no hardware to test it on. The next DT
revision will describe MMC0-2 and leave SMHC3 out until someone can test
driver support. If either of you would rather have it described now,
tell me and I'll put it back, in the same series as its user.

Sorry for the noise.

Best regards,
Enzo
