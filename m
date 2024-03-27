Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99DE14F9FD
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Mar 2024 21:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711574455; cv=none; b=flA8G3XWh9amu11ROviY6gryELnHVpi8vqGiDQcmJRsPTeMQvfGZwlnNdBWAipIreIEAP1TSv9Qm5yV18N+2hqWZ7Uj2EIPetxg6vMC9cbPgdqWnR6zTFbL0PZXtGNZ45T0B/3UpOGQ1xUtx5/0sdpoceYBDg9GFLFrVfnHGtig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711574455; c=relaxed/simple;
	bh=pnXP6K294ueuIv/kd4uAMj7jIU4MOvwGOqzoM3iOzzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=klZfXAOCQV+B9WGKeNR4khAD39YELGxFwBeYfpuBWY83Bp9KV81ahGCrAQvTc552gWlNoUTOUGuD6MaMWL/Hnx0YKj5H9ko7Alve4lNWRI2N+n6BME9uNQ0KAMfeJbu06trDsBnX1d13CQgmtUoH1bVOgNqCjOrTwKqnI3kDw+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqkrORZ5; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqkrORZ5"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5101cd91017so261130e87.2
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Mar 2024 14:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711574452; x=1712179252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ucufKvF5D/Jm5nZ+VW2enZzweqIXCgOTEb9SfQn2sM=;
        b=NqkrORZ5A6THMoFgYAY6hrEpOi1R9l9pYIyTUUMmhscM2WJghN7rqbGPkchP1hQY7F
         6zxdefpd8lzxw4zzeY9EU8T6WB3/PpXT5BPSo8Xx1fzvdpjtSIZ6p7dxQ+0+H/H8r1fS
         13vVkborl1LH8RgyoaiunL62xFu1QS0ISwYzUKap/17BbMamiffadHXu2I+Q+HUxE2xo
         CwiRubUy2mJoeOpHuIcznQfJermlF7nIQDf7SoxfW4IEaR3u6IzbOX2QxBZxQLA4pmKk
         B0Uo9QRJxSznmmU2x2RlV8RQyJSG0gT1sw9ZfEscvp0drnouZXUTHlZS1CzUQ+9uWW28
         I6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711574452; x=1712179252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ucufKvF5D/Jm5nZ+VW2enZzweqIXCgOTEb9SfQn2sM=;
        b=HcjflxZ3tQZ0LOMPdh1SjtdO0E59TOKOt9x4tIDvqKFOG2LQuurnwUzh5kVatEkyMR
         YcRZZmZgXo4lNbUIBe+ws/dbLbk6talZDsy/Nrr6g4Qbilau1aULwMSwj49UbJhe1J6u
         kTpwuEfBl0ddu3yo6sIbmuPk0QvmlVRbsqYLcYgmzGnNiOXfaXyIh6VwFZWGRHnmc7EX
         nRT0B3oKu6CgP8X24UFA2gKblqMQvmyUT8mCaVyuSypR0+AUu10siqhcWKBNmfkxi3Po
         HWxWCiOZumYhzwBYgdPAblN5BnNwPrOhwBFzSiDxbH+A1J4d9/obQwAyWmbJjS6NGeZ6
         01Dg==
X-Forwarded-Encrypted: i=1; AJvYcCU8cuX5zQ2PIbkNIiuW13Ze4EN9fu6kRpxkOx+j806t0YXe8yEVNgAXcGh+KeGQyYEPTkk23oJjT6nONsRXwOW4eMIX3TlBPMS1ZWI=
X-Gm-Message-State: AOJu0YxEKk3ACsS0qYGQjq+QgPjJhyBjVxtsM5t6bRB3sTgtpI6lWZb9
	mwbp6xX7K/uNSAbZxVQRuWzbBOQFoLNFh2HJL10pRCrKEaxRgOKw
X-Google-Smtp-Source: AGHT+IHz7ApOV4i4Dlb6iEnYuE8q/XfKfM2eV0rEqwdimV+tXaq/DQ/NttKfOC6IwUiIzIH/JNGmrQ==
X-Received: by 2002:a19:5e10:0:b0:515:a530:d570 with SMTP id s16-20020a195e10000000b00515a530d570mr439705lfb.59.1711574451864;
        Wed, 27 Mar 2024 14:20:51 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id q2-20020a1709060e4200b00a4674ad8ab9sm5809630eji.211.2024.03.27.14.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 14:20:51 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>,
 Martin Botka <martin.botka@somainline.org>,
 Martin Botka <martin.botka1@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>, Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH v3 5/8] cpufreq: sun50i: Add support for opp_supported_hw
Date: Wed, 27 Mar 2024 22:20:50 +0100
Message-ID: <1853595.atdPhlSkOF@jernej-laptop>
In-Reply-To: <20240326114743.712167-6-andre.przywara@arm.com>
References:
 <20240326114743.712167-1-andre.przywara@arm.com>
 <20240326114743.712167-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne torek, 26. marec 2024 ob 12:47:40 CET je Andre Przywara napisal(a):
> The opp_supported_hw DT property allows the DT to specify a mask of chip
> revisions that a certain OPP is eligible for. This allows for easy
> limiting of maximum frequencies, for instance.
> 
> Add support for that in the sun50i-cpufreq-nvmem driver. We support both
> the existing opp-microvolt suffix properties as well as the
> opp-supported-hw property, the generic code figures out which is needed
> automatically.
> However if none of the DT OPP nodes contain an opp-supported-hw
> property, the core code will ignore all OPPs and the driver will fail
> probing. So check the DT's eligibility first before using that feature.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


