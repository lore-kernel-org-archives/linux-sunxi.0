Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8343BBE8
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Apr 2024 05:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714023595; cv=none; b=smNCX8tWa1esPjYqAAVdkvBF2U0em3KScebOezc3gkQN8AJFoHyKnXrerfXhT946+lg5NPkpb85iLI4tZoEU93r7dfGu8WFCKHUxwOKeZK1kd90sTajG+1St4kfSwdArS+gMK7Q9lWAOTYUng3+Zm6e0oSD35q1W94XHj24NahU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714023595; c=relaxed/simple;
	bh=G+Pq9WK+Pf3AsXknbqoKgSyofmS2y1qL8CXJIT+xHcI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=cMRtfJJn7BhDzlm/2z8Zr28I9OT2bztXnObPPmKgZhHA1AeNqfoAJVzBWS4tjYmK/chvfaFmdUyqaoVObiVPXnn06VSEPABZCWLyQd5tF8gHys9eHFOuV7DBLtOeEBsso8TgKTTTqP0gPAwJ6SeAiG+Ku+rNg6//+zid2+Y8FAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=N8PVrIr0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hAMh3WM/; arc=none smtp.client-ip=64.147.123.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="N8PVrIr0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hAMh3WM/"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id B632B180014E;
	Thu, 25 Apr 2024 01:39:52 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Thu, 25 Apr 2024 01:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1714023592; x=
	1714109992; bh=8CrF5G9B7rbf4ywUM/FE/UWCnhlsJxP5TcR1bLPuTww=; b=N
	8PVrIr0RDlNz+hVpwsiqMQEbY9v0XkWjGEccBHNdTo1PUcp2LmxJcNCA76K9hylN
	hjMGZZPAcWL84sdqim0dSJ1r0njVFq7VSdyiypTL+UCgi5AgLoHjhGpk9qY5C+Ek
	BHXn5AKIrLo9BweY3vd/1nclLYTdkKOyhtoXUSHAhEknfzBOhyYi/JicuN9x83Ol
	QJvKEhhHsl8qizNWOR458MzgWQzE5qot+BB6g1sd+Njr6rjchpc8YPizl60Xq2oB
	0fUzbtUIqeOpD7d6id3l56IaFpSI4SoEFh0slL40sP9vP5foHNSLdYNsIbyByw5y
	qjDCU9E793KwvcOpSJY/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714023592; x=1714109992; bh=8CrF5G9B7rbf4ywUM/FE/UWCnhls
	JxP5TcR1bLPuTww=; b=hAMh3WM/ROdjXX0Spdbkz4uBo+qjh3m2Ud9y5ARpkZmt
	EGdM6fESOMYGT3AsLS6el+lbSZzfdU85qP8LRbedda1gQtfVCw2P5J5k3FS1woXt
	TSXrboInUcAFQvKdfx3oqRCNPIlFFQaHFzipO6BFkoJu5chW6exlyNawN9NUMoHE
	7aksvuVaYicLOgo1H4T6Djcm6o8noEflYcpwJFiXAg1bKig7Stnd21PhjjIMJh/3
	0LYzi+3gt52BBVh9Rhf3yNDeAfd/e05eb6Ml15Wvw1bVznS4wBBlyfe4lfwtJWmx
	a42VCrOac0lcJFr0wthvMM7p1PN+bf5xAlToUhGYlA==
X-ME-Sender: <xms:p-wpZi5zLL0j5Wd7ClYP2Pysa1sngz0kW0b7PT2pg-BwLUVqnopzig>
    <xme:p-wpZr56xtUUknIGfc8R1UnfDY_GqjK0bU2Wq7MSy_UQh3AWZMCXuaw69s0CFNSSK
    3oMdBg97HL4SkddVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeliedguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdft
    higrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehvdevieegudejueefgeffhefhffevudfhieejgfdtffetlefg
    teeuveeiudeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:p-wpZhdPUTruPxbM1DpQ9GsoBCaHNjP_PwScaK1gDvVcnRNhTRDqFw>
    <xmx:p-wpZvLCxAGSQzizPxAuUYbSdVQjU1zpgd2tQrKSR2DQJVWPaNLD-w>
    <xmx:p-wpZmIxSFf_l1IZ49rlZrnQxkKClYbWMbNOluzKhW4LyS549wI-Ew>
    <xmx:p-wpZgyvWQkqnjE8-jZv_GHf8ey0m0QEeeij78-UBpJ8pI7JiDBwPw>
    <xmx:qOwpZl8rXh-3Z1oIvihcYGTsnOCS6nEpAtc6Pyd4o9li_QamkdsTaCFe>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A6FF4A60078; Thu, 25 Apr 2024 01:39:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <429b3f1e-c42e-481b-adee-56852243535a@app.fastmail.com>
In-Reply-To: 
 <DM4PR05MB9229EE6BE60831DFD6C37A62A5172@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <20240424110947.9057-1-ryan@testtoast.com>
 <20240424110947.9057-3-ryan@testtoast.com>
 <20240425012559.44528ee9@minigeek.lan>
 <DM4PR05MB9229EE6BE60831DFD6C37A62A5172@DM4PR05MB9229.namprd05.prod.outlook.com>
Date: Thu, 25 Apr 2024 17:39:31 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: "Chen-Yu Tsai" <wens@csie.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/4] arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
Content-Type: text/plain

On Thu, 25 Apr 2024, at 1:58 PM, Chris Morgan wrote:
> On Thu, Apr 25, 2024 at 01:25:59AM +0100, Andre Przywara wrote:
>> On Wed, 24 Apr 2024 23:09:45 +1200
>> Ryan Walklin <ryan@testtoast.com> wrote:
>> 
>> Hi Ryan (and Chris),
>> 
>> many thanks for the changes, that looks really close now. Only a few
>> smaller comments this time.
>> 
Thanks both for the review.

>> > +&mmc2 {
>> > +	vmmc-supply = <&reg_cldo4>;
>> > +	vqmmc-supply = <&reg_aldo1>;
>> 
>> This is now fixed to 1.8V, which doesn't look right. Either it's not
>> the right regulator, or you should extend its range to cover 3.3V as
>> well.
>
> The IO is fixed at 1.8v (both the SDIO pins and the UART1 pins for
> bluetooth). If you raise this regulator too high the system becomes
> unstable.
>
Ideally LV signalling would work for UHS but unsure if that is achievable. FWIW the vendor BSP does refer to the vqmmc supply being ALDO1 but allows a range up to 3.5v. Will test out a 3.3v max and confirm it is unstable.


>> > +&r_rsb {
>> > +   status = "okay";
>> 
>> This is indented with spaces, not a tab.
Fixed, ta.

>> > +		regulators {
>> > +			reg_dcdc1: dcdc1 {
>> > +				regulator-always-on;
>> > +				regulator-boot-on;
>> 
>> boot-on doesn't make much sense here: that allows it to be turned off,
>> which we don't want. Also the binding documentation in regulator.yaml
>> says that it's only intended "where software cannot read the state of
>> the regulator", which is not true here.
>> regulator-always-on is all we need - technically speaking not even
>> that, since cpu0 is a consumer, but we need to play safe here.

Thanks for the explanation, this and others fixed.

>> > +			reg_aldo3: aldo3 {
>> > +				regulator-always-on;
>> > +				regulator-min-microvolt = <1800000>;
>> > +				regulator-max-microvolt = <1800000>;
>> > +				regulator-name = "axp717-aldo3";
>> 
>> So do we know for sure that's critical? And do we have any clue what
>> this supplies?
>> There is AVCC, VCC_HDMI, VCC_TV, VCC_RTC, all at 1.8V. The middle two
>> are not critical.
>> 
Unsure currently, but can try with the HDMI patchset and see if I can identify VCC_HDMI at least. At least one of the audio-codec-connected regulators is presumably AVCC for the amp.

>> > +			};
>> > +
>> > +			reg_aldo4: aldo4 { /* 5096000.codec */
>> > +				regulator-always-on;
>> 
>> Is that necessary? What happens if that is turned off? Looks like only
>> the WiFi and potentially audio is affected? I think it can go then,
>> also pg-supply would reference it, so it would effectively be enabled
>> anyways.
>
> I think this does something critical, as in my testing tinkering with
> this regulator or turning it off locks up the system.

Agreed, unclear what else it is powering but at least the G-bank of GPIOs and also possibly VCC18_DRAM for the DRAM controller?


>> > +			reg_cldo1: cldo1 { /* 5096000.codec */
>> > +				/* unused */
>> > +				regulator-min-microvolt = <3300000>;
>> > +				regulator-max-microvolt = <3300000>;
>> 
>> Looks a bit odd to have an "unused" comment, but also a voltage range
>> specified. Judging from the comment this might be supplying some audio
>> circuitry, which we don't need at the moment?

Thanks, have removed the range for now.

Ryan
