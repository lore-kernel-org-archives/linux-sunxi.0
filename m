Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C3517FA
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Aug 2023 08:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469C0C433C7;
	Fri, 25 Aug 2023 08:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692952287;
	bh=7nAGFeMgyNYi5BNqSaxJiL1eivb/5MRbcWz8tHcCp60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i+WaksenItzDocxk4UeJvxdI2xD3oHSE1eL0mG49zHXNTfBSablRLDv5cuDaL954i
	 yI+Nhft8FAThp5rVCl5DtlrEUkOePquDrMkxP+DwxQM0V6DdkN3WYJDPkcq8hKDdKA
	 IuV8LNbzXRxijy5t5p3nvORBXgvuFrGrRpzLcB/qhuF6fnYUYNbdX3cx2p8KuU1/6W
	 MV0P/wwUo1zWp4qH9PJMn6meuAZQSvh3VMMrcmOZKu1f0x/yw/SHhen6jEtt9iSYva
	 W9tlCbAfI0lvVg9/ycacp07zm5Q6o3l/k+i1Xo5kxYRyfx+acQlhbWg8fPwZdJdyQr
	 OSbi5SKff3Yaw==
Date: Fri, 25 Aug 2023 10:31:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-sunxi@lists.linux.dev, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH RFC] clk: sunxi-ng: test: Add integration tests for
 ccu_nkm
Message-ID: <vjdaehvyjwduzv4ollusfumlfmjgohy7qrinwbutjni7igwlwq@7zjf7x76guhx>
References: <20230730-nkm_clk_tests-v1-1-ed4aad26a815@oltmanns.dev>
 <7hwrskiwpu4x3qwr7sntr7hswswqsj3a2qdje3cwoq7dk3uf5v@5bjhwythmrtz>
 <87ila0nf1f.fsf@oltmanns.dev>
 <ehhy6q7w7lbgtaytxfhyocbzpqsxmzc35snjrpu2dutwnxkrd4@5dgtihwsmaoa>
 <87jztjoaaq.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x2pvk33m4eszgdj4"
Content-Disposition: inline
In-Reply-To: <87jztjoaaq.fsf@oltmanns.dev>


--x2pvk33m4eszgdj4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 09:23:09AM +0200, Frank Oltmanns wrote:
> Hi,
>=20
> On 2023-08-21 at 12:31:09 +0200, Maxime Ripard <mripard@kernel.org> wrote:
> > [[PGP Signed Part:Undecided]]
> > Hi,
> >
> > On Mon, Jul 31, 2023 at 07:53:32PM +0200, Frank Oltmanns wrote:
> >> On 2023-07-31 at 17:42:29 +0200, Maxime Ripard <mripard@kernel.org> wr=
ote:
> >> > [[PGP Signed Part:Undecided]]
> >> > Hi Frank,
> >> >
> >> > On Sun, Jul 30, 2023 at 08:48:47AM +0200, Frank Oltmanns wrote:
> >> >> Test the ccu_nkm clock in the context of the clk framework (integra=
tion
> >> >> test).
> >> >>
> >> >> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> >> >> ---
> >> >> In order to facilitate testing the changes I'm currently working on=
 [1]
> >> >> I'm making use of kunit tests.
> >> >>
> >> >> I'm wondering if these could be useful for inclusion in the kernel.=
 I'm
> >> >> using integration tests because my goal is to test that the clocks =
work
> >> >> as expected in the context of the clk framework.
> >> >>
> >> >> Note, that this is just an RFC for now. I want to test the waters t=
o see
> >> >> if anyone thinks that this is worth working on, i.e. if the benefit=
 of
> >> >> this kind of tests is worth the maintenance burden.
> >> >>
> >> >> Please let me know what you think.
> >> >>
> >> >> Thanks,
> >> >>   Frank
> >> >>
> >> >> [1]: https://lore.kernel.org/all/20230717-pll-mipi_set_rate_parent-=
v4-0-04acf1d39765@oltmanns.dev/
> >> >> ---
> >> >>  drivers/clk/sunxi-ng/.kunitconfig   |   4 +
> >> >>  drivers/clk/sunxi-ng/Kconfig        |   7 +
> >> >>  drivers/clk/sunxi-ng/Makefile       |   8 +
> >> >>  drivers/clk/sunxi-ng/ccu_nkm_test.c | 646 ++++++++++++++++++++++++=
++++++++++++
> >> >>  4 files changed, 665 insertions(+)
> >> >>
> [=E2=80=A6]
> >> >> diff --git a/drivers/clk/sunxi-ng/ccu_nkm_test.c b/drivers/clk/sunx=
i-ng/ccu_nkm_test.c
> >> >> new file mode 100644
> >> >> index 000000000000..a2cf9f5f95bb
> >> >> --- /dev/null
> >> >> +++ b/drivers/clk/sunxi-ng/ccu_nkm_test.c
> >> >> @@ -0,0 +1,646 @@
> >> >> +// SPDX-License-Identifier: GPL-2.0+
> >> >> +/*
> >> >> + * Kunit integration tests for ccu_nkm clocks.
> >> >> + *
> >> >> + * This is an integration test suite as it tests the behaviour of =
ccu_nkm in the context of the
> >> >> + * kernel's clk framework.
> >> >> + */
> >> >> +#include <linux/clk.h>
> >> >> +#include <linux/clk-provider.h>
> >> >> +
> >> >> +#include "ccu_nkm.h"
> >> >> +
> >> >> +/* for nkm initialization */
> >> >> +#include "ccu_mult.h"
> >> >> +#include "ccu_div.h"
> >> >> +
> >> >> +/* CCU memory */
> >> >> +#include <linux/logic_iomem.h>
> >> >> +#include <linux/io.h>
> >> >> +
> >> >> +#include <kunit/test.h>
> >> >> +#include <kunit/test-bug.h>
> >> >> +
> >> >> +struct ccu_nkm_test_context {
> >> >> +	struct clk_hw parent_hw;
> >> >> +	struct ccu_nkm nkm_clk;
> >> >> +	unsigned long parent_set_rate;
> >> >> +	unsigned long parent_multiplier;
> >> >> +	void __iomem *ccu_iomem;
> >> >> +	u32 reg;
> >> >> +};
> >> >> +
> >> >> +#define PARENT_CLOCK_BASE_RATE	(24 * 1000 * 1000)
> >> >> +#define NKM_REGISTER		0x040
> >> >> +
> >> >> +/*****************************************************************=
*********************************
> >> >> + * Virtual CCU IO memory
> >> >> + *
> >> >> + * Using virtual memory in order to run the suite on user mode lin=
ux and without actually affecting
> >> >> + * the hardware.
> >> >> + *****************************************************************=
*********************************/
> >> >> +#define CCU_IOMEM_START	0x01C20000
> >> >> +#define CCU_IOMEM_SIZE	0x400
> >> >> +
> >> >> +static struct resource virt_ccu_iomem_resource =3D {
> >> >> +	.name	=3D "CCU iomem",
> >> >> +	.start	=3D CCU_IOMEM_START,
> >> >> +	.end	=3D CCU_IOMEM_START + CCU_IOMEM_SIZE - 1,
> >> >> +	.flags	=3D IORESOURCE_MEM,
> >> >> +};
> >> >> +
> >> >> +static unsigned long virt_ccu_iomem_read(void *priv, unsigned int =
offset, int size)
> >> >> +{
> >> >> +	struct kunit *current_test =3D kunit_get_current_test();
> >> >> +	struct ccu_nkm_test_context *ctx =3D current_test->priv;
> >> >> +	u32 val =3D ctx->reg;
> >> >> +
> >> >> +	pr_info("ccu_nkm_test: Reading val 0x%x from %p, offset 0x%x, siz=
e %i\n", val, priv, offset,
> >> >> +		size);
> >> >> +	KUNIT_EXPECT_EQ_MSG(current_test, NKM_REGISTER, offset,
> >> >> +			    "Only reads from offset 0x%x are expected\n", NKM_REGISTER);
> >> >> +	KUNIT_EXPECT_EQ_MSG(current_test, 4, size,
> >> >> +			    "Only reads with size 4 are expected\n");
> >> >> +
> >> >> +	return val;
> >> >> +}
> >> >> +
> >> >> +static void virt_ccu_iomem_write(void *priv, unsigned int offset, =
int size, unsigned long val)
> >> >> +{
> >> >> +	struct kunit *current_test =3D kunit_get_current_test();
> >> >> +	struct ccu_nkm_test_context *ctx =3D current_test->priv;
> >> >> +
> >> >> +	pr_info("ccu_nkm_test: Writing to %p, offset 0x%x, size %i, val 0=
x%lx\n", priv, offset,
> >> >> +		size, val);
> >> >> +
> >> >> +	/* Only expect writes to the NKM register */
> >> >> +	KUNIT_EXPECT_EQ_MSG(current_test, NKM_REGISTER, offset,
> >> >> +			    "Only writes to offset 0x%x are expected\n", NKM_REGISTER);
> >> >> +	KUNIT_EXPECT_EQ_MSG(current_test, 4, size,
> >> >> +			    "Only writes with size 4 are expected\n");
> >> >> +	ctx->reg =3D val;
> >> >> +}
> >> >> +
> >> >> +static const struct logic_iomem_ops virt_ccu_iomem_ops =3D {
> >> >> +	.read	=3D virt_ccu_iomem_read,
> >> >> +	.write	=3D virt_ccu_iomem_write,
> >> >> +};
> >> >> +
> >> >> +static long virt_ccu_iomem_map(unsigned long offset, size_t size,
> >> >> +			       const struct logic_iomem_ops **ops,
> >> >> +			       void **priv)
> >> >> +{
> >> >> +	pr_debug("ccu_nkm_test: Mapping offset %lu, size %lu\n", offset, =
size);
> >> >> +
> >> >> +	*ops =3D &virt_ccu_iomem_ops;
> >> >> +	return 0;
> >> >> +}
> >> >> +
> >> >> +static const struct logic_iomem_region_ops virt_ccu_iomem_map_ops =
=3D {
> >> >> +	.map =3D virt_ccu_iomem_map,
> >> >> +};
> >> >> +
> >> >> +
> >> >
> >> > I think this needs to be part of a larger discussion with the kunit
> >> > maintainers on whether or not mocking entire devices is something we
> >> > should aim for, and if it is, how can be ease that mocking.
> >> >
> >> > Having that boilerplate in each and every driver doesn't look
> >> > sustainable to me.
> >>
> >> I agree. Maybe I pushed it out the door a little bit to earlier, but I
> >> wanted to have a discussion rather sooner than later. Before I put too
> >> much thought into where to put something that nobody needs anyway. ;)
> >>
> >> I think this could be way simpler if we just reserved a chunk of memor=
y,
> >> i.e. the  the 1024 KB CCU mem and just map that, so that we can do the
> >> read and write operations to and from the mapped memory. Furthermore,
> >> this could be a virtual driver in the um tree. Similar to
> >> arch/um/drivers/virt-pci.c, but much(!) simpler.
> >
> > Another thing to think about here is that it's also fairly redundant
> > with qemu. And I think it would serve a larger purpose to emulate the
> > clocks in qemu and write a kernelci test to do the exact same checks
> > than you're doing here.
>=20
> That does sound interesting. Since I'm not familiar with qemu (yet), I
> have some trouble finding examples where this is used for similar cases.
> So, if you (or someone else) have specific examples in mind, I'd greatly
> appreciate some pointers.

So, it's not super complex, you want to have a kernel and userspace
image like you would do for any other system. Then you can run it with
qemu-system-arm with something like (for another board I had to test for
recently)

qemu-system-arm \
    -M sabrelite \ # Board we want to test
    -smp 4 \ # 4 CPUs
    -m 1G \ # 1GB of RAM
    -display none -serial stdio \ # No display, just serial
    -kernel arch/arm/boot/zImage \ # Kernel Image
    -dtb arch/arm/boot/dts/imx6q-sabrelite.dtb  \ # Device Tree
    -append "trace_event=3Dclk:* tp_printk earlyprintk console=3Dttymxc0,11=
5200n8"

I didn't need a filesystem image back then, but you should add one with the
-drive option.

Then, you'd need some kind of test program that would check the clock
rate from userspace. Any language will do.

Finally, KernelCI has a github repo where you can add new tests, so you
can contribute there if relevant.

> So far, my understanding is, that the qemu target "orangepi-pc" supports
> the CCU [1]. Should we be using that?

We have a bunch of targets indeed: cubieboard (A10), orangepi-pc (H3)
and the Bananapi M2-Ultra (R40?)

That covers a decent chunk of the SoC we support (of the relevant ones
at least).

> Or should there be a new target?

But yeah, there might be needs to create additional targets there.

It looks fairly similar to what you wrote already :)
https://lore.kernel.org/qemu-devel/20230523100508.32564-3-qianfanguijin@163=
=2Ecom/

Maxime

--x2pvk33m4eszgdj4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOhm3AAKCRDj7w1vZxhR
xSJNAQCSXprUWNx3XKTHs44ZUcgPT6A3caCP8PKSU+gbnVm3VwD/byVXL4rdKz9i
AXwI4gnSibF7Fo7ychEgoUtxEIg12A0=
=Udec
-----END PGP SIGNATURE-----

--x2pvk33m4eszgdj4--
