Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33D257898
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 09:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713344911; cv=none; b=n7dcjHt0zbvbO2TR09Xq25j7OKFdKmFFXrgTEJ+A6qsG1dR/2GR8NXrO9k3T8el3nv9jmSGtKuICaPsyWCRLXbLfsdDX1RHvRhT1a76DtyLggOJ2zF6EWaV6fQjzjHtGyEH5RMJ41TuOCfEe2XxsilFt60hC2qnmcRaHPWg3HLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713344911; c=relaxed/simple;
	bh=9wMPOGcMfFhs576IvQ/3eQ44FOciCioeMSGj1QMA970=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=r+9Gy6VzCK38Sg6ywbQPvwz7EIzqKxGv3mhW7pj2xO/nrkKgXg0MODDgSnsNSud0V6JALwEaZuLLSw6qO9WAztrl4XVO8gY3WPVTZV2GB2Vs+1CoKS8hvPZ8XUgUpzQEw4LteVCO7Mcffxr55T83E9BfyJxiZ6rfaH5bcUm39os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Gz9pC/K1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eFUw+9zF; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Gz9pC/K1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eFUw+9zF"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 2E34D18000D1;
	Wed, 17 Apr 2024 05:08:28 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Wed, 17 Apr 2024 05:08:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1713344907; x=
	1713431307; bh=OEuPHp7Mhc4rHaqG5rHQ9AxcWl4mv6Ixa/oolIbFFNw=; b=G
	z9pC/K1Ehf1HLjPxinsuFu6x94mjI0Cl/5FCeEkYwc5/qnQ1UnZ6V2jMP/zgI6WZ
	IEpwtq7+KXQUbdlJCxncDIawRFLu7GnqNIhI/1NQ5Fsax0Bz/kBetjb9eiKaX2JY
	JhqJyOhM8ZmoPSKMAa2NEf+M+EaKw1i6jPiyi2Abt+fuKNQOoIEnhDzcuAWJKLjc
	n6mCw6LHPpcuw2svPhxkK2yIFhhU7ufN/yMLOF3eD8kPO0W3NuqEPCIhVXDJovBD
	8XXiTJPBJNBwdOJ2D/eJ0iYIldIESxCJPSdbYIrNQQqgq3BXb7WK0UFbwIA4V7nD
	7wzrXb3C1enNDv0fwxpZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713344907; x=1713431307; bh=OEuPHp7Mhc4rHaqG5rHQ9AxcWl4m
	v6Ixa/oolIbFFNw=; b=eFUw+9zFwjFhdmESbiH52HE3mOdEg+cHi69gFpZVdTK+
	tIT2cw0KirpSbooBgUJLLNSHijdRzc7P7oYrT8VuhFfdNMwo8pNewzfuT3GtFEvT
	mr2/Vpzp+XvRXwC6wwiFaGOAnRfv3lYIn6VCydNT59XPLX/UwtzTAGzCZ068L7yY
	/zMD1dSTinaFwzW/RVEen/mtugA/uMyat7Q4RZ4PGAnmNeO29lC2RubJLQogOyub
	w7LaohmvS9qtt0hwyrOvduFQsoq6lksXFq/+Xch3YH1e5CyUBY+Kqf5heMHOXQ7i
	EMHDLpDH7Z4VvA2Af97vwB8RRcq1wRwcxDxvnYmdDw==
X-ME-Sender: <xms:i5EfZuVDiB1AQ8pYLQ2iO6TJEwkoq3PheH1fxXAsG0Qq67tv01VfBw>
    <xme:i5EfZqnCFnWZTJ3qx9zwvA7aAKqcDrq_Ddt0O5U-OrExDRZS6G_j6umiHKV3mFS1h
    R2a1ENPRpGdJeK0mA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejkedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftfih
    rghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecugg
    ftrfgrthhtvghrnhepveefledufeffjeefleegleeuudduieeiueduvefgudfhfeegjeeh
    jedvieehgefgnecuffhomhgrihhnpehlihhnrghrohdrohhrghdprhgvrgguthhhvgguoh
    gtshdrihhonecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mheprhihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:i5EfZiYQwUbaLouARbETuoRuZwO-Rpy1VjanCEd00SIRw97EbBhuQg>
    <xmx:i5EfZlVwobAxtbA5t6uqLa6vlpREJkCuxOtnqBdpV-qfla3L45dWuw>
    <xmx:i5EfZon2SMCSoT3VPn85pSjHUXn9MosuReSkhFoBQKxr9H544RQynA>
    <xmx:i5EfZqeqwgGY6ryzxkGakKh4NtW2aB6tI_igAgs0z8ohb347Ajc_tw>
    <xmx:i5EfZhc97gpbSmwu86xkUwK7j9L7jayqlT1-pTIcH_dMnpP7iVoM1ryy>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 61F08A60079; Wed, 17 Apr 2024 05:08:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <1eb4a701-e0f2-4615-aac6-53f10f762ada@app.fastmail.com>
In-Reply-To: <c615c0b0-3dd4-4bac-8bd5-654fd8a35d0c@linaro.org>
References: <20240414083347.131724-2-ryan@testtoast.com>
 <20240414083347.131724-5-ryan@testtoast.com>
 <c615c0b0-3dd4-4bac-8bd5-654fd8a35d0c@linaro.org>
Date: Wed, 17 Apr 2024 21:08:07 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Andre Przywara" <andre.przywara@arm.com>, "Chen-Yu Tsai" <wens@csie.org>,
 "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>,
 "Chris Morgan" <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/4] arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
Content-Type: text/plain

> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
>
> No uppercase letters are allowed as node names.

Apologies, this was my omission.

> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>
Noted, thanks.

>> +
>> +    reg_vcc5v: vcc5v {
>
> Use some common reasonable prefix, e.g. regulator
>
Noted, thanks.

> Please do not add dead code without explanation.

Noted, thanks.

Regards,

Ryan
