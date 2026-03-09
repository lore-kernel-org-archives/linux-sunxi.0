Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D6C3D7D6B
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Mar 2026 15:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070071; cv=none; b=JB9l6wxf9Z25fGTkDQF2vz+W6bCZDCcJMea08CWtbPClU+mKz4n/QWLpkQsG8eIfPIlPy8xoyqRr05k7ZJxlFtzqGSo0Bcg9vl+56E3kv+p2rhu2sHpIudhaI2Tc2phFkE18t+b11n2kmjR6ECr9dS2t7OP7jcDIhCMp8xn1m3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070071; c=relaxed/simple;
	bh=7o2lSlwnqD1IVDD/21T16zX/mpFvqv7Ltx6kYFACD5k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q4o0PRAgBD41a0N2AXzsCHseLfl3whBGU851xQtOuF4Pr8gkCqGdkQuOLD08QatUCrx47HadgUvNT5ZGxgEghdjSndQhVAc+XcL0BhnDrCLUDIwihGKRD8Fjeh70zcMMXlllNzbwXGuS/NyhWUQz50Mfy/Ad0u7oziEPwzfhZmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NcIIly4D; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NcIIly4D"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8663FC4287A;
	Mon,  9 Mar 2026 15:28:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21DD15FFB8;
	Mon,  9 Mar 2026 15:27:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A34C810369A9B;
	Mon,  9 Mar 2026 16:27:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773070067; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7o2lSlwnqD1IVDD/21T16zX/mpFvqv7Ltx6kYFACD5k=;
	b=NcIIly4DbRfRXqvItRLuep3qvqLnq7SWhqJtYzXeNVq2UihIuui7iJgcIR9rZ7xWW5Htgk
	DrnDaxi8xhMGISqAKGpd0ZYMozw4VtIKNzmAMN8P7zyyJ5RbuoEAwpobhkkGBsiXOuQ2WE
	x0v/927EmHkOjGGwcFUC+Hfw5D3mV0ZgxuOAd+MzRN/YWnV3OBq8QwsuB692Tvyg1CcEnf
	VYQSx1JfLeeHLZ0mwzfH2Adf+oROoXoyOhZrGgJAKAm92N8GElRtRDmfq7HGxmfo0tLBog
	izRJVSb3XnR45xZUIzhSonml8BF0sWdzQWNrrZaC7jlCX8HQ6LKGS6vEhLxVYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Chen-Yu Tsai <wens@csie.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,  Wentao
 Liang <vulab@iscas.ac.cn>,  Maxime Ripard <mripard@kernel.org>,  Boris
 Brezillon <bbrezillon@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] mtd: rawnand: sunxi: do not count BBM bytes twice
In-Reply-To: <20260305100137.2558423-4-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Thu, 5 Mar 2026 11:01:34 +0100")
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
	<20260305100137.2558423-4-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 09 Mar 2026 16:27:42 +0100
Message-ID: <87a4whnhu9.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Richard,

On 05/03/2026 at 11:01:34 +01, Richard Genoud <richard.genoud@bootlin.com> =
wrote:

> BBM is part of USER_DATA section, so we should remove it twice

Maybe you mean "is already part" and as such the end of the sentence
should be that "we should *not* remove it twice"?

> This was working ok because we are on the safe size, advertising that
> there was 2 bytes less available than in reality.
>
> But we can't change old platforms, since it may lead to a different ECC
> strength, so, introduce a legacy flag for old platforms, and switch the
> new platforms to the correct count.
>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Thanks,
Miqu=C3=A8l
