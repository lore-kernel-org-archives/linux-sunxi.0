Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763BD556B85
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Sep 2026 15:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882724; cv=none; b=XxQvOlY2WF3HfbyutpCXlk/y0+rzzKeG/Kp34+E8+Rn9Dg8oeBX8EQutL7HKGqVDv9mTnBdDG9uMJ4b+PZw3v6v/pliPEeMSs/ugMXPNpphlFrMXYDmQfjnrbHSe0dwg3ndKPEjCx9qyo5V2OFb6PjXsPMTkbxC/yQX5Nx+hb64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882724; c=relaxed/simple;
	bh=DAhVo+VnvuwPf8P1BI0svmi6m7U7fXWrZ8gzfloqoPY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KAzmxVk+lWwlR8kuDhIhGdQd+ZXB3fQOUJ3yMVkFpwQvk4lRF8FlzsXk9tKoRkwkafeDXb8FsDJMi0h1WCzEFNbmcW7R+LS0HWM8MR1q2LNUKbQjSkhjzZZvafIsxKbCRuRbwfkxuYHlGomFMEFHDDISvjkHEkcxhTGhjvkV7b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=C2nxzAJ/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="C2nxzAJ/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0DF491A1A5A;
	Tue,  8 Sep 2026 15:51:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D37BE6031F;
	Tue,  8 Sep 2026 15:51:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2476D11C7AF49;
	Tue,  8 Sep 2026 17:51:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788882711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DAhVo+VnvuwPf8P1BI0svmi6m7U7fXWrZ8gzfloqoPY=;
	b=C2nxzAJ/2j1JQy7Wp+D4kWMW3N7lqM5p8+HWmkRrLjB8pT4MGOshpbTVcWIHpNilkCUC8U
	Iso2bROUUjnekiNbw0hO8//tj/RMQ307uz8DdvsbCs4Mzh9bIGXDEX2AFPezDyWozHpGQW
	wmhlHFJ1WoxG/o0tLsAqUqJ40DGKiYqLgVHW5U0zAIlRSDyrJFpdPfI5SoPuOU3iC9vkfW
	2V4GhxIvoYPQR9Q4TdeOx1gRFst/gW5FkfXTFghGir3fwetU1Su2gg8rpNDEFrDGPHN6DM
	s3Sz2VwYMFMVRa29P+ymcXOSyJ64NJgAPXDeX8xIwEgsb4OZwcqPKJmjRCIdYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mtd: rawnand: sunxi: support randomized OOB formats
In-Reply-To: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-2-b12074f4aca7@gmail.com>
	(James Hilliard's message of "Fri, 04 Sep 2026 15:22:12 -0600")
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
	<20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-2-b12074f4aca7@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 08 Sep 2026 17:51:46 +0200
Message-ID: <87ik4fu4fh.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi James,

On 04/09/2026 at 15:22:12 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> The controller randomizer covers the bad block marker along with the
> rest of the OOB data. The driver currently compensates the marker bytes
> before writes and after reads so that they remain plain on flash.
>
> Allwinner NAND firmware instead stores the marker through the
> randomizer. Media using that format appears to contain bad blocks unless
> the randomizer is enabled while reading the marker.
>
> Honor the allwinner,randomized-oob property by marking the NAND as
> requiring scrambling during normal hardware-ECC transfers and leaving
> the marker in the randomizer data stream. Keep the existing plain marker
> behavior when the property is absent. Reject the property with software
> or disabled ECC because those paths do not operate the controller
> randomizer.
>
> MTD_OPS_RAW behavior remains unchanged: raw accesses bypass both ECC and
> randomization and expose the physical representation. The raw-NAND
> core's bad-block and flash-BBT paths use decoded accesses and therefore
> continue through the hardware-ECC/randomizer path.
>
> This changes marker handling on all supported controllers; the H6/H616
> protected user-data placement is handled separately.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I believe it is still not completely working. If you look at the error
path in the read functions, in case we face a factory bad block, there
will be no data, we will face the "page is maybe empty" case where we
still address columns like before. Since data is randomized with these
accesses, I believe we would return errors which will not be interpreted
correctly by the core. The discovery of the factory bad block markers is
thus broken during BBT scan. But a BBT read is also broken, because even
if errors are ignored, we perform pattern matching on data which is, if
my understanding of your implementation is correct, not de-randomized in
this case.

Thanks,
Miqu=C3=A8l
