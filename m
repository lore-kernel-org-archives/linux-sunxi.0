Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0815947E
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Aug 2023 12:47:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B39BB1063;
	Mon, 14 Aug 2023 05:48:15 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AAB93F64C;
	Mon, 14 Aug 2023 05:47:31 -0700 (PDT)
Date: Mon, 14 Aug 2023 13:47:29 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Martin Botka
 <martin.botka@somainline.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Alan Ma
 <tech@biqu3d.com>, Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: nvmem: SID: Add binding for H616
 SID controller
Message-ID: <20230814134729.533f61b1@donnerap.manchester.arm.com>
In-Reply-To: <5856748.MhkbZ0Pkbq@jernej-laptop>
References: <20230814-sid-h616-v2-0-0267749b4471@somainline.org>
	<830e5e34-f6de-3233-4a12-06c8390169d1@linaro.org>
	<DKGDZR.4G4SZ781MVSV2@somainline.org>
	<5856748.MhkbZ0Pkbq@jernej-laptop>
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

On Mon, 14 Aug 2023 12:28:36 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

> Dne ponedeljek, 14. avgust 2023 ob 10:21:49 CEST je Martin Botka napisal(=
a):
> > On Mon, Aug 14 2023 at 10:08:38 AM +02:00:00, Krzysztof Kozlowski
> >=20
> > <krzysztof.kozlowski@linaro.org> wrote: =20
> > > On 14/08/2023 08:38, Martin Botka wrote: =20
> > >>  Add binding for the SID controller found in H616 SoC
> > >> =20
> > >>  Signed-off-by: Martin Botka <martin.botka@somainline.org>
> > >>  ---
> > >>=20
> > >> Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> > >>=20
> > >> | 1 +
> > >> |=20
> > >>   1 file changed, 1 insertion(+)
> > >> =20
> > >>  diff --git
> > >>=20
> > >> a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.ya=
ml
> > >> b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.ya=
ml
> > >>=20
> > >>  index 296001e7f498..2ec0a1b8f803 100644
> > >>  ---
> > >>=20
> > >> a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.ya=
ml
> > >>=20
> > >>  +++
> > >>=20
> > >> b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.ya=
ml
> > >>=20
> > >>  @@ -27,6 +27,7 @@ properties:
> > >>             - const: allwinner,sun50i-a64-sid
> > >>        =20
> > >>         - const: allwinner,sun50i-h5-sid
> > >>         - const: allwinner,sun50i-h6-sid
> > >> =20
> > >>  +      - const: allwinner,sun50i-h616-sid =20
> > >=20
> > > It does not look like you tested the DTS against bindings. Please run
> > > `make dtbs_check` (see
> > > Documentation/devicetree/bindings/writing-schema.rst or
> > > https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree=
-sour
> > > ces-with-the-devicetree-schema/ for instructions).
> > >=20
> > > Best regards,
> > > Krzysztof =20
> >=20
> > Yea completely forgot. Sorry for that.
> >=20
> > Will send v3 tomorrow with proper binding patch using items with enums =
=20
>=20
> Don't. You have cca. 1 month time now, since you missed at least window f=
or DT=20
> changes for 6.6.

Plus we need to figure out if my comment about using a fallback compatible
was actually correct, as asked here:
https://lore.kernel.org/linux-arm-kernel/20230811234212.2236c814@slackpad.l=
an/

Cheers,
Andre
