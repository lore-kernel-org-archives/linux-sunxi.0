Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0870408D0
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Jun 2023 22:48:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F5F62F4;
	Fri,  9 Jun 2023 15:49:38 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BC413F663;
	Fri,  9 Jun 2023 15:48:51 -0700 (PDT)
Date: Fri, 9 Jun 2023 23:48:23 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Mikhail Kalashnikov
 <iuncuim@gmail.com>, Samuel Holland <samuel@sholland.org>, Icenowy Zheng
 <uwu@icenowy.me>, Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/5] sunxi: H616: dram: split struct dram_para
Message-ID: <20230609234823.0920c02c@slackpad.lan>
In-Reply-To: <4810216.GXAFRqVoOG@jernej-laptop>
References: <20230607000745.10245-1-andre.przywara@arm.com>
	<20230607000745.10245-4-andre.przywara@arm.com>
	<4810216.GXAFRqVoOG@jernej-laptop>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 09 Jun 2023 22:26:21 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Dne sreda, 07. junij 2023 ob 02:07:43 CEST je Andre Przywara napisal(a):
> > Currently there is one DRAM parameter struct for the Allwinner H616 DRAM
> > "driver". It contains many fields that are compile time constants
> > (set by Kconfig variables), though there are also some fields that are
> > probed and changed over the runtime of the DRAM initialisation.
> >=20
> > Because of this mixture, the compiler cannot properly optimise the code
> > for size, as it does not consider constant propagation in its full
> > potential.
> >=20
> > Help the compiler out by splitting that structure into two: one that on=
ly
> > contains values known at compile time, and another one where the values
> > will actually change. The former can then be declared "const", which wi=
ll
> > let the compiler fold its values directly into the code using it.
> >=20
> > We also add "const" tags for some new "struct dram_config" pointers, to
> > further increase code optimisation.
> > To help the compiler optimise the code further, the definition of the
> > now "const struct dram_para" has to happen at a file-global level, so
> > move that part out of sunxi_dram_init().
> >=20
> > That results in quite some code savings (almost 2KB), and helps to keep
> > the code small with the LPDDR3 support added later.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com> =20
>=20
> Nice trick. It could be used also in other DRAM drivers.

You bet ;-)

I have a patch for the H6 already. It doesn't save as much there
(merely 500 bytes), I guess because we don't have as many build time
parameters, but the H6 SPL is very big, so every byte saved there is a
win. Will post this ASAP.

> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Many thanks for that!

Cheers,
Andre
