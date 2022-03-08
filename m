Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45FB2F33
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Mar 2022 04:23:51 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.119.155])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 0109C206D5
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Mar 2022 04:23:44 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
	by relay3.mymailcheap.com (Postfix) with ESMTPS id 1E9773F15F;
	Tue,  8 Mar 2022 05:23:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by filter1.mymailcheap.com (Postfix) with ESMTP id 723922A0E8;
	Tue,  8 Mar 2022 04:23:35 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
	by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jeHFxe6SDY9L; Tue,  8 Mar 2022 04:23:34 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter1.mymailcheap.com (Postfix) with ESMTPS;
	Tue,  8 Mar 2022 04:23:34 +0000 (UTC)
Received: from edelgard.icenowy.info (unknown [59.41.163.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 52283405D2;
	Tue,  8 Mar 2022 04:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1646713413; bh=k0d3/gz2J3W9YdWoOG9KVHtWjaa85mv9twsA4XHA0FU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=DDnz5FibW+XmSKvge2XG5J2wGAHBXs6GvoYi+kPfxlOzc2Ck9A+Zw4UNHv8c0i6/p
	 j+ZIfp6c6qmMEQ5aUrZ59RiOe365zA8BveN3xPMrBDe07fLiPbbjUE3V4wR0B6dTeZ
	 Wtl+LoyQduQ3ZCys1J4XHb/a6IsZvxbLzDfXb/co=
Message-ID: <5edad86493b145761a7f156f830d84f3413091c9.camel@aosc.io>
Subject: Re: [PATCH 05/14] ARM: dts: suniv: F1C100: fix CPU node
From: Icenowy Zheng <icenowy@aosc.io>
To: Jesse Taube <mr.bossman075@gmail.com>, Andre Przywara
	 <andre.przywara@arm.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai
	 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	 <samuel@sholland.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>, George Hilliard
 <thirtythreeforty@gmail.com>,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev
Date: Tue, 08 Mar 2022 12:23:23 +0800
In-Reply-To: <526e09f8-6006-643a-70c6-d9b85e6cdb75@gmail.com>
References: <20220307143421.1106209-1-andre.przywara@arm.com>
	 <20220307143421.1106209-6-andre.przywara@arm.com>
	 <526e09f8-6006-643a-70c6-d9b85e6cdb75@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

在 2022-03-07星期一的 21:44 -0500，Jesse Taube写道：
> 
> 
> On 3/7/22 09:34, Andre Przywara wrote:
> > The /cpu node in the f1c100s.dtsi is not spec compliant, it's
> > missing
> > the reg property, and the corresponding address and size cells
> > properties.
> > 
> > Add them to make the bindings check pass.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >   arch/arm/boot/dts/suniv-f1c100s.dtsi | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> > b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> > index 922efd5e9457..43d342eaf661 100644
> > --- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> > +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> > @@ -29,9 +29,13 @@ osc32k: clk-32k {
> >         };
> >   
> >         cpus {
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> >                 cpu {
> cpu@0
> 
> also is memory node required?

It should be filled by U-Boot.

> 
> Thanks,
> jesse
> >                         compatible = "arm,arm926ej-s";
> >                         device_type = "cpu";
> > +                       reg = <0x0>;
> >                 };
> >         };
> >   


