Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592CA441022;
	Tue, 28 Jul 2026 14:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249658; cv=none; b=ijztMOa2BMq8W1RlubqgNPPO5xUi69CR8ySMRMCuIcKbsp1NFd/rMrCw8ETmKhWvGFbk98TCN9zg31zl26OeZ++sRq52WC3gwPN29FDlzGoWCEFDjwGizTps2ogKkG/eHuQNkxieBBcvUe+gJesLM+aQwd84B2Y7md/tKStPWTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249658; c=relaxed/simple;
	bh=HrkvZelFWkR1011QlWgWLdivFtvaI0kVKKWOC00mReE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=az3XtBTOGOXbod4PxDkRM3UAHslhB2rsglo2gzBxF24KeThNIYJpmDWf/2bnpiQPo6aR2c+scbPCjWmOa+OtBaor7DuuTdNdz2JtHBTj6HEDt5vw8qh3Ys1Mptz0KhdanWlxtn9Gt0/iYOf4nc2lkxEDTAg97kXigDzAK45ULSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pmdg9BoH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pmdg9BoH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBF31F00A3A;
	Tue, 28 Jul 2026 14:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785249657;
	bh=dTB8jM1GR8BsZlOvZgtYiyOlUFOjPcQWnbBkkPY9bXc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Pmdg9BoHWzBkZCQRWtzB2FY+8OXhH9KFVinxwFWFYOoiQFth9SjffZR5YCB/Dn1UU
	 qWhfYJDnE7V//QhfMF+yOulJumV6LvvhuOgNf5lBe+ngP3dG5vxUPQEnyi2Inari95
	 Oinid25blOAlpXsHiqSk3ki0Ft5L+KX4wJ/WiiHdceV51Oo3XwFdcs8Urnt3OAF8HQ
	 Rr1YMjr4MfOFWm5lazzXKAtn46fmYuIJkTKZjD3ACv/DQfL6UDTp5F4t5iXUpbHVZe
	 vShbAv98ZhnEK9qvEMthgS0JyO/2Dc/4Fz/QjnfhP7eK5Mu80F0ZD4O8UoE6Joa5Jk
	 5nxTnXTnC8L9w==
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-sunxi@lists.linux.dev, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Dragan Simic <dsimic@manjaro.org>, 
 Andrey Skvortsov <andrej.skvortzov@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260725111909.2244868-1-megi@xff.cz>
References: <20260725111909.2244868-1-megi@xff.cz>
Subject: Re: [PATCH] arm64: dts: allwinner: sun50i-a64-pinephone: Fix
 mpu6050 mount matrix
Message-Id: <178524965479.668575.6507291604446263040.b4-ty@kernel.org>
Date: Tue, 28 Jul 2026 22:40:54 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2

On Sat, 25 Jul 2026 13:19:07 +0200, Ondřej Jirman wrote:
> The current mount matrix for mpu6050 is wrong. The mount matrix is a
> simple transform from the sensor coordinate space to the device
> coordinate space described in DT, where, looking at the screen, X
> points to the right, Y to the top, and Z towards the user.
> 
> The mpu6050 is mounted like this (looking at the screen from the
> front; the sensor is on the near side of the PCB, so its Z axis
> points towards the user; o marks the pin 1 corner):
> 
> [...]

Applied to sunxi/dt-for-7.3 in sunxi, thanks!

[1/1] arm64: dts: allwinner: sun50i-a64-pinephone: Fix mpu6050 mount matrix
      https://git.kernel.org/sunxi/linux/c/dfc735fd93e4

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

