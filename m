Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DF68633F
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Mar 2025 16:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741883193; cv=pass; b=S7CNithcCquj9jNXAeS4G+cZIbneEJDBhz+kNO0jGtaeQ00+6jzUDSuBU5EbutpSlMft/+O+BX26VaKk7vbw86ipg9P1/AFuU9KjTu9PzqZijk5wIGOm39i7U8yAxE2LskkuQhb6CtTU8mzEOkl6UHFL3DFHuy0zCkT3NgN4EMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741883193; c=relaxed/simple;
	bh=uJuy6cbGWaVFPgMZ51upwkH1TGfDddUyofGuoQ3/DL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7hpqMKacmJm5X6phueEpqC8TotR60ssy8nnSmnpzAmd+9DlDEDHt8AV6svCHLsk6bI8OdHA0rQPmhryvMXC9xzQuMJ1eDkgCNGTzwhcmCXePnYpPcwbBu+awe5j98wkLaQSLj7symdAf5SfsQ5QjgeJag9QDmmY/OfBBfIKEj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fossekall.de; spf=pass smtp.mailfrom=fossekall.de; dkim=pass (2048-bit key) header.d=fossekall.de header.i=@fossekall.de header.b=ibNrTaek; dkim=permerror (0-bit key) header.d=fossekall.de header.i=@fossekall.de header.b=jYIi6SJG; arc=pass smtp.client-ip=81.169.146.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fossekall.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fossekall.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fossekall.de header.i=@fossekall.de header.b="ibNrTaek";
	dkim=permerror (0-bit key) header.d=fossekall.de header.i=@fossekall.de header.b="jYIi6SJG"
ARC-Seal: i=1; a=rsa-sha256; t=1741882828; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=cNuTcV3wc70G1bwoTfovS9OnAa8+G1W+DWZn9JvVy7eyCUX9r0bLPzSo5FZP9RNP+O
    DDkiX4EknTB8OBvFgnhUKsaBgiCQ4iARy7jiJ3gu5flh1DCOEsDaldEHROmwhGUcyczB
    7cd9SUH7EYq2qbqLPIgitoCu98bjbwnsIhfjaf/9pXr4bvAoPxVl/wbHXoDorumLwz9Z
    BsTWJP5gDVpB1B1CkTSES5MqKt6fpGJK/FHQUCOzsB9cgefEtN+WEH5BVAdG99TEES5U
    QF5fdCrrdFf4XA5zxCBuVZUoSV3GerhxcdUWn9VPgvy2IgUut7G3mU7jTmZIqe/0OD4n
    dIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1741882828;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=gP4fMJNb3zv1AitbCQSn1pjlRysOlMPHj4XRBVuNy1Q=;
    b=qwLpM/Kgjap3eMtqOc/ifvtNGfG20UR9bwyfWZZ7jLVHr8rvJfLZoUPstrH+AozDQd
    lENvQ6lxd+DkprJyTo2isPYKEAiVGIihnCfHjCuydvMTpOd2/ITSWUiOqseJxm6C0Tn4
    h4BrDffX9HhYbmKb0FIjLzEzwFbUgtDyo8GlXNkBtC/BviMwpTD0IqTrWQ1W34XkdI/g
    eLL2PS3XsFLNwHq5nXX6X7YTGw6Ozv1YZNxDloIpco7J0xtH2B0bS7JmuVgX1Haq2rvE
    A4kLrAb3hvrGP2BzLn9Gf5kiINBG8juY8iDgBSlcRMIYyrbehH7vN8tHP2Bk4z+jWahA
    71hQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1741882828;
    s=strato-dkim-0002; d=fossekall.de;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=gP4fMJNb3zv1AitbCQSn1pjlRysOlMPHj4XRBVuNy1Q=;
    b=ibNrTaekradQzlbtQYUK2gUwxHlTrZlXEMVGzjE23HQK132Sv3X0fixFNydGIzHaTe
    vYIPQx+lo+JDKeYznEm/fbXH9mImoU71Q37swIbgXRTuVBtAd9xChgxe8vFYlwv6LaOl
    xuPowJiu0KWGvLZsg2+em5BhZNjZ6tzTAaJLLagu+1w7+tI7IbUsAiGNkLfHXvOX5Dx0
    3CPaSsLSvI2ViEA+Iwq7uYX7u1RirZIP959af543s8r3peR0Ub9wpIKqrtcmWy7vVn+t
    v1zxQfOkZdjSX3Xh+m3Dg/E3jJ98DZ87+06znMUzdU294Qh0fdUtJ3n+CdegMLea8u/6
    P4gQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1741882828;
    s=strato-dkim-0003; d=fossekall.de;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=gP4fMJNb3zv1AitbCQSn1pjlRysOlMPHj4XRBVuNy1Q=;
    b=jYIi6SJGrt1CFfwL2f0m2ONhy+C3qPthFrIk3kvIlSyTBIuKCvro16nMTlhdgR8+Oo
    +QybSxPaAvtt3LB12GCQ==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBdao6FTL4AJcMdm+lap4JEHkzok9eyEg=="
Received: from aerfugl
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id f28b3512DGKRpon
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 13 Mar 2025 17:20:27 +0100 (CET)
Received: from koltrast.home ([192.168.1.27] helo=a98shuttle.de)
	by aerfugl with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <michael@fossekall.de>)
	id 1tslIJ-0005U0-0S;
	Thu, 13 Mar 2025 17:20:27 +0100
Date: Thu, 13 Mar 2025 17:20:25 +0100
From: Michael Klein <michael@fossekall.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: bananapi: add support for PHY LEDs
Message-ID: <Z9MFyWGG5iNUmRNq@a98shuttle.de>
References: <20250312193629.85417-1-michael@fossekall.de>
 <20250312193629.85417-2-michael@fossekall.de>
 <4637912.LvFx2qVVIh@jernej-laptop>
 <Z9KYqlfUYxRaWnGQ@a98shuttle.de>
 <20250313104042.694c1856@donnerap.manchester.arm.com>
 <7cf91323-d550-496a-a8ec-ae104c77224d@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7cf91323-d550-496a-a8ec-ae104c77224d@lunn.ch>

On Thu, Mar 13, 2025 at 02:17:27PM +0100, Andrew Lunn wrote:
>On Thu, Mar 13, 2025 at 10:40:42AM +0000, Andre Przywara wrote:
>> On Thu, 13 Mar 2025 09:34:50 +0100
>> Michael Klein <michael@fossekall.de> wrote:
>> > On Thu, Mar 13, 2025 at 07:07:24AM +0100, Jernej Škrabec wrote:
>> > >Dne sreda, 12. marec 2025 ob 20:36:28 Srednjeevropski standardni čas je Michael Klein napisal(a):
>> > >> The Bananapi M1 has three LEDs connected to the RTL8211E ethernet PHY.
>> > >> Add the corresponding nodes to the device tree.
>> > >>
>> > >> Signed-off-by: Michael Klein <michael@fossekall.de>
>> > >
>> > >This is patch 2/2. Which one is patch 1/2? I got only one.
>> >
>> > https://patchwork.kernel.org/project/netdevbpf/patch/20250312193629.85417-1-michael@fossekall.de/
>> >
>> > Sorry for any inconvenience in case I messed up the patch submission.
>> >
>> > I made two commits for this change and submitted them via `git send-email
>> > HEAD^^`. The first patch went to netdev@vger.kernel.org, the second
>> > to linux-arm-kernel@lists.infradead.org, which seems logical. Have I
>> > done something wrong?
>>
>> Well, for those really small "series" it's probably better to send all
>> patches to everyone, especially if the first patch gives some context,
>> without which the second leaves people (like me) scratching their head.
>
>However, netdev does not like pathchsets which contain patches which
>should not be applied to the netdev tree. DT patches generally go
>through a different Maintainer to driver changes implementing the
>binding.
>
>So for your DT patch, you could add to the commit message something
>like:
>
>The RTL8211E ethernet PHY driver has recently gained support for
>controlling PHY LEDs via /sys/class/leds. The Bananapi M1 has three
>LEDs connected to the RTL8211E PHY.  Add the corresponding nodes to
>the device tree.

Thanks, this totally makes sense. I'll split the patch series then and 
follow-up here with the updated commit message when the netdev change is 
accepted.

-- 
Michael
