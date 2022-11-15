Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CB127722
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 17:57:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3662F13D5;
	Tue, 15 Nov 2022 09:57:19 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 023943F587;
	Tue, 15 Nov 2022 09:57:10 -0800 (PST)
Date: Tue, 15 Nov 2022 17:57:08 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jernej =?UTF-8?B?xaBrcmFiZWM=?=
 <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Icenowy Zheng <uwu@icenowy.me>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 03/11] phy: sun4i-usb: add support for the USB PHY on
 F1C100s SoC
Message-ID: <20221115175708.3e69dcd8@donnerap.cambridge.arm.com>
In-Reply-To: <e861e62f-4148-b867-0155-e71b1cee0b81@linaro.org>
References: <20221106154826.6687-1-andre.przywara@arm.com>
	<20221106154826.6687-4-andre.przywara@arm.com>
	<Y2ypy0CM8rJGu2g4@matsya>
	<4438485.LvFx2qVVIh@jernej-laptop>
	<52920a00-8e29-f7f4-0cbd-ceb638ded970@linaro.org>
	<20221115104426.20728ba5@donnerap.cambridge.arm.com>
	<4516dcfb-b928-d454-18a6-bd725f39cc24@linaro.org>
	<20221115161917.328ec91a@donnerap.cambridge.arm.com>
	<e861e62f-4148-b867-0155-e71b1cee0b81@linaro.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Nov 2022 17:29:09 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

Hi,

> On 15/11/2022 17:19, Andre Przywara wrote:
> > On Tue, 15 Nov 2022 16:00:54 +0100
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> >=20
> > Hi,
> >  =20
> >> On 15/11/2022 11:44, Andre Przywara wrote: =20
> >>> On Tue, 15 Nov 2022 11:03:24 +0100
> >>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> >>>
> >>> Hi,
> >>>    =20
> >>>> On 15/11/2022 07:01, Jernej =C5=A0krabec wrote:   =20
> >>>>> Dne =C4=8Detrtek, 10. november 2022 ob 08:35:39 CET je Vinod Koul n=
apisal(a):     =20
> >>>>>> On 06-11-22, 15:48, Andre Przywara wrote:     =20
> >>>>>>> From: Icenowy Zheng <uwu@icenowy.me>
> >>>>>>>
> >>>>>>> The F1C100s SoC has one USB OTG port connected to a MUSB controll=
er.
> >>>>>>>
> >>>>>>> Add support for its USB PHY.     =20
> >>>>>>
> >>>>>> This does not apply for me, please rebase and resend
> >>>>>>
> >>>>>> Also, consider splitting phy patches from this. I dont think there=
 is
> >>>>>> any dependency     =20
> >>>>>
> >>>>> DT patches in this series depend on functionality added here.
> >>>>>      =20
> >>>>
> >>>> DTS always goes separately from driver changes because it is a hardw=
are
> >>>> description. Depending on driver means you have potential ABI break,=
 so
> >>>> it is already a warning sign.   =20
> >>>
> >>> We understand that ;-)
> >>> What Jernej meant was that the DTS patches at the end depend on patch
> >>> 01/10, which adds to the PHY binding doc. I am not sure if Vinod's
> >>> suggestion was about splitting off 01/10, 03/10, and 10/10, or just t=
he
> >>> two latter which touch the driver.
> >>>
> >>> I can split off 03/10 and 10/10, rebased on top of linux-phy.git/next=
, and
> >>> send that to Vinod.
> >>> Then I would keep 01/10 in a respin of this series here, to satisfy t=
he
> >>> dependency of the later DTS patches, and Vinod can pick that one patc=
h from
> >>> there?   =20
> >>
> >> There is no hard dependency of DTS on bindings. You can split these (a=
nd
> >> some maintainers prefer that way) and in DTS patches just provide the
> >> link to the bindings, saying it is in progress. =20
> >=20
> > But that breaks "make dtbs_check", doesn't it? =20
>=20
> The check will be broken anyway because binding goes via driver
> subsystem and DTS goes via arm-soc.
>=20
> If both make to the linux-next and next release, then it's not a problem.
>=20
> >=20
> > I would think that the DT bits - bindings first, then DTS files using i=
t -
> > should be bundled. This is how I imagine the future(TM), where DTs and
> > bindings live outside the kernel repo. =20
>=20
> Yes, that's preferred. Therefore in DTS patch you say the binding is not
> merged and it is here - lore link.
>=20
> >  =20
> >> The bindings should be however kept with driver changes as it goes the
> >> same way. =20
> >=20
> > I understand that the bindings describe the contract the driver acts on,
> > but going forward I think driver changes would need to come later, then
> > (since they will live in a separate repo at some day)?
> > Maybe pointing to the binding changes in progress? =20
>=20
> Later as one commit later - yes. Later as other option - not really, why?
>=20
> > So with a separate repo we would actually need to upstream just the
> > bindings first, then could push driver changes and .dts files
> > independently? =20
>=20
> There is no separate repo, so we talk about Linux case now.
>=20
> > And for now it looks like we are stuck with putting everything in one
> > series, to make both checkpatch and dtbs_check happy. =20
>=20
> You should rather make maintainers happy :) and here one asked to split.

Well, he asked to split off the USB PHY patches from the rest of the
series, since there is some conflict with the recently merged H616 USB PHY
patches. It is still unclear to me whether this split includes the binding
patch, or just the two patches touching the actual code.

Cheers,
Andre.
