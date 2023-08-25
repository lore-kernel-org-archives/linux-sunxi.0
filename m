Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1B4377
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Aug 2023 07:23:21 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4RXBJ51mF7z9t4g;
	Fri, 25 Aug 2023 09:23:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1692948197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQUwGT3a9pbXPEbDorWecWQ9r7hij64HhpCjOx3vd/4=;
	b=I56bhQsuJ37V18MA3ixS8QWKTMMvv4Pzkn2VgtMqvXjyuwpP1A4dDBE2My1j5n4eIzZ/e8
	m9YPYJNIO7m3YOobtequKGAjsqahjFnWwgoAmRkjbXLG9tlZkDUvpDBi0Fo1aCG9j6JfkB
	2O9x38+H11GsNIawHwOSKgCva83IvI3MjqDBIyzwYFfxlFgBkbbD8CxILwylvY5O33jVJn
	mT8qH2w9xBZU+1Dw7Yyr2v/n5vDWZEpkoTs44id9nCuIRCXcZ32yJA8dZywB80Mg1LSYz1
	diuRWeCV+9eVO1w7tXRwL1FsMX2sV4L3TU/mgMLjwdlFxQR39j8XM4FOEPbgAg==
References: <20230730-nkm_clk_tests-v1-1-ed4aad26a815@oltmanns.dev>
 <7hwrskiwpu4x3qwr7sntr7hswswqsj3a2qdje3cwoq7dk3uf5v@5bjhwythmrtz>
 <87ila0nf1f.fsf@oltmanns.dev>
 <ehhy6q7w7lbgtaytxfhyocbzpqsxmzc35snjrpu2dutwnxkrd4@5dgtihwsmaoa>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Maxime Ripard <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>
Subject: Re: [PATCH RFC] clk: sunxi-ng: test: Add integration tests for ccu_nkm
In-reply-to: <ehhy6q7w7lbgtaytxfhyocbzpqsxmzc35snjrpu2dutwnxkrd4@5dgtihwsmaoa>
Date: Fri, 25 Aug 2023 09:23:09 +0200
Message-ID: <87jztjoaaq.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4RXBJ51mF7z9t4g

Hi,

On 2023-08-21 at 12:31:09 +0200, Maxime Ripard <mripard@kernel.org> wrote:
> [[PGP Signed Part:Undecided]]
> Hi,
>
> On Mon, Jul 31, 2023 at 07:53:32PM +0200, Frank Oltmanns wrote:
>> On 2023-07-31 at 17:42:29 +0200, Maxime Ripard <mripard@kernel.org> wrot=
e:
>> > [[PGP Signed Part:Undecided]]
>> > Hi Frank,
>> >
>> > On Sun, Jul 30, 2023 at 08:48:47AM +0200, Frank Oltmanns wrote:
>> >> Test the ccu_nkm clock in the context of the clk framework (integrati=
on
>> >> test).
>> >>
>> >> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
>> >> ---
>> >> In order to facilitate testing the changes I'm currently working on [=
1]
>> >> I'm making use of kunit tests.
>> >>
>> >> I'm wondering if these could be useful for inclusion in the kernel. I=
'm
>> >> using integration tests because my goal is to test that the clocks wo=
rk
>> >> as expected in the context of the clk framework.
>> >>
>> >> Note, that this is just an RFC for now. I want to test the waters to =
see
>> >> if anyone thinks that this is worth working on, i.e. if the benefit of
>> >> this kind of tests is worth the maintenance burden.
>> >>
>> >> Please let me know what you think.
>> >>
>> >> Thanks,
>> >>   Frank
>> >>
>> >> [1]: https://lore.kernel.org/all/20230717-pll-mipi_set_rate_parent-v4=
-0-04acf1d39765@oltmanns.dev/
>> >> ---
>> >>  drivers/clk/sunxi-ng/.kunitconfig   |   4 +
>> >>  drivers/clk/sunxi-ng/Kconfig        |   7 +
>> >>  drivers/clk/sunxi-ng/Makefile       |   8 +
>> >>  drivers/clk/sunxi-ng/ccu_nkm_test.c | 646 ++++++++++++++++++++++++++=
++++++++++
>> >>  4 files changed, 665 insertions(+)
>> >>
[=E2=80=A6]
>> >> diff --git a/drivers/clk/sunxi-ng/ccu_nkm_test.c b/drivers/clk/sunxi-=
ng/ccu_nkm_test.c
>> >> new file mode 100644
>> >> index 000000000000..a2cf9f5f95bb
>> >> --- /dev/null
>> >> +++ b/drivers/clk/sunxi-ng/ccu_nkm_test.c
>> >> @@ -0,0 +1,646 @@
>> >> +// SPDX-License-Identifier: GPL-2.0+
>> >> +/*
>> >> + * Kunit integration tests for ccu_nkm clocks.
>> >> + *
>> >> + * This is an integration test suite as it tests the behaviour of cc=
u_nkm in the context of the
>> >> + * kernel's clk framework.
>> >> + */
>> >> +#include <linux/clk.h>
>> >> +#include <linux/clk-provider.h>
>> >> +
>> >> +#include "ccu_nkm.h"
>> >> +
>> >> +/* for nkm initialization */
>> >> +#include "ccu_mult.h"
>> >> +#include "ccu_div.h"
>> >> +
>> >> +/* CCU memory */
>> >> +#include <linux/logic_iomem.h>
>> >> +#include <linux/io.h>
>> >> +
>> >> +#include <kunit/test.h>
>> >> +#include <kunit/test-bug.h>
>> >> +
>> >> +struct ccu_nkm_test_context {
>> >> +	struct clk_hw parent_hw;
>> >> +	struct ccu_nkm nkm_clk;
>> >> +	unsigned long parent_set_rate;
>> >> +	unsigned long parent_multiplier;
>> >> +	void __iomem *ccu_iomem;
>> >> +	u32 reg;
>> >> +};
>> >> +
>> >> +#define PARENT_CLOCK_BASE_RATE	(24 * 1000 * 1000)
>> >> +#define NKM_REGISTER		0x040
>> >> +
>> >> +/*******************************************************************=
*******************************
>> >> + * Virtual CCU IO memory
>> >> + *
>> >> + * Using virtual memory in order to run the suite on user mode linux=
 and without actually affecting
>> >> + * the hardware.
>> >> + *******************************************************************=
*******************************/
>> >> +#define CCU_IOMEM_START	0x01C20000
>> >> +#define CCU_IOMEM_SIZE	0x400
>> >> +
>> >> +static struct resource virt_ccu_iomem_resource =3D {
>> >> +	.name	=3D "CCU iomem",
>> >> +	.start	=3D CCU_IOMEM_START,
>> >> +	.end	=3D CCU_IOMEM_START + CCU_IOMEM_SIZE - 1,
>> >> +	.flags	=3D IORESOURCE_MEM,
>> >> +};
>> >> +
>> >> +static unsigned long virt_ccu_iomem_read(void *priv, unsigned int of=
fset, int size)
>> >> +{
>> >> +	struct kunit *current_test =3D kunit_get_current_test();
>> >> +	struct ccu_nkm_test_context *ctx =3D current_test->priv;
>> >> +	u32 val =3D ctx->reg;
>> >> +
>> >> +	pr_info("ccu_nkm_test: Reading val 0x%x from %p, offset 0x%x, size =
%i\n", val, priv, offset,
>> >> +		size);
>> >> +	KUNIT_EXPECT_EQ_MSG(current_test, NKM_REGISTER, offset,
>> >> +			    "Only reads from offset 0x%x are expected\n", NKM_REGISTER);
>> >> +	KUNIT_EXPECT_EQ_MSG(current_test, 4, size,
>> >> +			    "Only reads with size 4 are expected\n");
>> >> +
>> >> +	return val;
>> >> +}
>> >> +
>> >> +static void virt_ccu_iomem_write(void *priv, unsigned int offset, in=
t size, unsigned long val)
>> >> +{
>> >> +	struct kunit *current_test =3D kunit_get_current_test();
>> >> +	struct ccu_nkm_test_context *ctx =3D current_test->priv;
>> >> +
>> >> +	pr_info("ccu_nkm_test: Writing to %p, offset 0x%x, size %i, val 0x%=
lx\n", priv, offset,
>> >> +		size, val);
>> >> +
>> >> +	/* Only expect writes to the NKM register */
>> >> +	KUNIT_EXPECT_EQ_MSG(current_test, NKM_REGISTER, offset,
>> >> +			    "Only writes to offset 0x%x are expected\n", NKM_REGISTER);
>> >> +	KUNIT_EXPECT_EQ_MSG(current_test, 4, size,
>> >> +			    "Only writes with size 4 are expected\n");
>> >> +	ctx->reg =3D val;
>> >> +}
>> >> +
>> >> +static const struct logic_iomem_ops virt_ccu_iomem_ops =3D {
>> >> +	.read	=3D virt_ccu_iomem_read,
>> >> +	.write	=3D virt_ccu_iomem_write,
>> >> +};
>> >> +
>> >> +static long virt_ccu_iomem_map(unsigned long offset, size_t size,
>> >> +			       const struct logic_iomem_ops **ops,
>> >> +			       void **priv)
>> >> +{
>> >> +	pr_debug("ccu_nkm_test: Mapping offset %lu, size %lu\n", offset, si=
ze);
>> >> +
>> >> +	*ops =3D &virt_ccu_iomem_ops;
>> >> +	return 0;
>> >> +}
>> >> +
>> >> +static const struct logic_iomem_region_ops virt_ccu_iomem_map_ops =
=3D {
>> >> +	.map =3D virt_ccu_iomem_map,
>> >> +};
>> >> +
>> >> +
>> >
>> > I think this needs to be part of a larger discussion with the kunit
>> > maintainers on whether or not mocking entire devices is something we
>> > should aim for, and if it is, how can be ease that mocking.
>> >
>> > Having that boilerplate in each and every driver doesn't look
>> > sustainable to me.
>>
>> I agree. Maybe I pushed it out the door a little bit to earlier, but I
>> wanted to have a discussion rather sooner than later. Before I put too
>> much thought into where to put something that nobody needs anyway. ;)
>>
>> I think this could be way simpler if we just reserved a chunk of memory,
>> i.e. the  the 1024 KB CCU mem and just map that, so that we can do the
>> read and write operations to and from the mapped memory. Furthermore,
>> this could be a virtual driver in the um tree. Similar to
>> arch/um/drivers/virt-pci.c, but much(!) simpler.
>
> Another thing to think about here is that it's also fairly redundant
> with qemu. And I think it would serve a larger purpose to emulate the
> clocks in qemu and write a kernelci test to do the exact same checks
> than you're doing here.

That does sound interesting. Since I'm not familiar with qemu (yet), I
have some trouble finding examples where this is used for similar cases.
So, if you (or someone else) have specific examples in mind, I'd greatly
appreciate some pointers.

So far, my understanding is, that the qemu target "orangepi-pc" supports
the CCU [1]. Should we be using that? Or should there be a new target?

[1]: https://qemu-project.gitlab.io/qemu/system/arm/orangepi.html

Best regards,
  Frank

>
>> > I also don't really see the point. It will be a nightmare to scale to
>> > support all of our clocks (let alone all our devices), we don't have a=
ny
>> > idea whether our model is actually the one implemented by the hardware,
>> > and it's not really what we want to test anyway.
>> >
>> > What we want to test is whether the software is sane, so that means th=
at
>> > we want to make sure that set_parent and set_rate are consistent with
>> > determine_rate for any given clock. And we don't need to emulate a
>> > device to do that, we can just overload set_rate and set_parent,
>> > possibly exporting some internal functions to split the register access
>> > from the actual coeff computation.
>>
>> I had a the following goal with this test suite:
>>  1. Understand and document the behavior of the sunxi clocks.
>>  2. Make sure that my changes don't break anything.
>>
>> Of course, the simple example tests I provided don't do that (yet). But
>> I was wondering if I should do the tests properly and preserve them for
>> posterity or if I use them just for myself.
>
> Sure, I get it :)
>
> We have another angle though, we want to make sure that they are as
> cheap as possible to maintain, test relevant scenarios, and scale as
> well as possible.
>
> These goals are not necessarily conflicting with each others, but they
> still are fairly different.
>
>> >> +struct ccu_nkm_combo {
>> >> +	u8	n;
>> >> +	u8	k;
>> >> +	u8	m;
>> >> +};
>> >> +
>> >> +/*
>> >> + * This table contains all meaningful combinations of n, k, and m.
>> >> + * That means that combinations that result in the same clock rate
>> >> + * are only listed once. For example, both { .n =3D 1, .k =3D 2, .m =
=3D 2}
>> >> + * and { .n =3D 2, .k =3D 2, .m =3D 4} are valid values for n, k, an=
d m,
>> >> + * but only the first one is in this list because both result in a
>> >> + * factor of 1.0.
>> >> + */
>> >
>> > I think we should test both cases.
>>
>> The combos are used to calculate the target rate. 192 MHz * 2 * 2 / 4 is
>> the same as 192 MHz * 1 * 2 / 2. So the number that runs through the
>> test subject is the same in both cases (192 MHz).
>>
>> >> +static struct ccu_nkm_combo all_nkm_combos[] =3D {
>> >> +	{ .n =3D  1, .k =3D  2,  .m =3D 16 /* 0.1250000*/ },
>> >> +	{ .n =3D  1, .k =3D  2,  .m =3D 15 /* 0.1333333*/ },
>> >> +	{ .n =3D  1, .k =3D  2,  .m =3D 14 /* 0.1428571*/ },
>> >> +	{ .n =3D  1, .k =3D  2,  .m =3D 13 /* 0.1538462*/ },
>> >> +	{ .n =3D  1, .k =3D  2,  .m =3D 12 /* 0.1666667*/ },
>> >> +	{ .n =3D  1, .k =3D  2,  .m =3D 11 /* 0.1818182*/ },
>> >> +	{ .n =3D  1, .k =3D  3,  .m =3D 16 /* 0.1875000*/ },
>> >> +	{ .n =3D  1, .k =3D  2,  .m =3D 10 /* 0.2000000*/ },
>> >> +	{ .n =3D  1, .k =3D  3,  .m =3D 14 /* 0.2142857*/ },
>> >> +	{ .n =3D  1, .k =3D  2,  .m =3D  9 /* 0.2222222*/ },
>> >> +	{ .n =3D  1, .k =3D  3,  .m =3D 13 /* 0.2307692*/ },
>> >> +	{ .n =3D  1, .k =3D  2,  .m =3D  8 /* 0.2500000*/ },
>> >> +	{ .n =3D  2, .k =3D  2,  .m =3D 15 /* 0.2666667*/ },
>> >> +	{ .n =3D  1, .k =3D  3,  .m =3D 11 /* 0.2727273*/ },
>> >> +	{ .n =3D  1, .k =3D  2,  .m =3D  7 /* 0.2857143*/ },
>> >> +	{ .n =3D  1, .k =3D  3,  .m =3D 10 /* 0.3000000*/ },
>> >> +	{ .n =3D  2, .k =3D  2,  .m =3D 13 /* 0.3076923*/ },
>> >> +	{ .n =3D  1, .k =3D  2,  .m =3D  6 /* 0.3333333*/ },
>> >> +	{ .n =3D  2, .k =3D  2,  .m =3D 11 /* 0.3636364*/ },
>> >> +	{ .n =3D  3, .k =3D  2,  .m =3D 16 /* 0.3750000*/ },
>> >> +	{ .n =3D  1, .k =3D  2,  .m =3D  5 /* 0.4000000*/ },
>> >> +	{ .n =3D  3, .k =3D  2,  .m =3D 14 /* 0.4285714*/ },
>> >> +	{ .n =3D  2, .k =3D  2,  .m =3D  9 /* 0.4444444*/ },
>> >> +	{ .n =3D  3, .k =3D  2,  .m =3D 13 /* 0.4615385*/ },
>> >> +	{ .n =3D  1, .k =3D  2,  .m =3D  4 /* 0.5000000*/ },
>> >> +	{ .n =3D  4, .k =3D  2,  .m =3D 15 /* 0.5333333*/ },
>> >> +	{ .n =3D  3, .k =3D  2,  .m =3D 11 /* 0.5454545*/ },
>> >> +	{ .n =3D  3, .k =3D  3,  .m =3D 16 /* 0.5625000*/ },
>> >> +	{ .n =3D  2, .k =3D  2,  .m =3D  7 /* 0.5714286*/ },
>> >> +	{ .n =3D  3, .k =3D  2,  .m =3D 10 /* 0.6000000*/ },
>> >> +	{ .n =3D  4, .k =3D  2,  .m =3D 13 /* 0.6153846*/ },
>> >> +	{ .n =3D  5, .k =3D  2,  .m =3D 16 /* 0.6250000*/ },
>> >> +	{ .n =3D  3, .k =3D  3,  .m =3D 14 /* 0.6428571*/ },
>> >> +	{ .n =3D  1, .k =3D  2,  .m =3D  3 /* 0.6666667*/ },
>> >> +	{ .n =3D  3, .k =3D  3,  .m =3D 13 /* 0.6923077*/ },
>> >> +	{ .n =3D  5, .k =3D  2,  .m =3D 14 /* 0.7142857*/ },
>> >> +	{ .n =3D  4, .k =3D  2,  .m =3D 11 /* 0.7272727*/ },
>> >> +	{ .n =3D  3, .k =3D  2,  .m =3D  8 /* 0.7500000*/ },
>> >> +	{ .n =3D  5, .k =3D  2,  .m =3D 13 /* 0.7692308*/ },
>> >> +	{ .n =3D  2, .k =3D  2,  .m =3D  5 /* 0.8000000*/ },
>> >> +	{ .n =3D  3, .k =3D  3,  .m =3D 11 /* 0.8181818*/ },
>> >> +	{ .n =3D  5, .k =3D  2,  .m =3D 12 /* 0.8333333*/ },
>> >> +	{ .n =3D  3, .k =3D  2,  .m =3D  7 /* 0.8571429*/ },
>> >> +	{ .n =3D  7, .k =3D  2,  .m =3D 16 /* 0.8750000*/ },
>> >> +	{ .n =3D  4, .k =3D  2,  .m =3D  9 /* 0.8888889*/ },
>> >> +	{ .n =3D  3, .k =3D  3,  .m =3D 10 /* 0.9000000*/ },
>> >> +	{ .n =3D  5, .k =3D  2,  .m =3D 11 /* 0.9090909*/ },
>> >> +	{ .n =3D  6, .k =3D  2,  .m =3D 13 /* 0.9230769*/ },
>> >> +	{ .n =3D  7, .k =3D  2,  .m =3D 15 /* 0.9333333*/ },
>> >> +	{ .n =3D  5, .k =3D  3,  .m =3D 16 /* 0.9375000*/ },
>> >> +	{ .n =3D  1, .k =3D  2,  .m =3D  2 /* 1.0000000*/ },
>> >> +	{ .n =3D  8, .k =3D  2,  .m =3D 15 /* 1.0666667*/ },
>> >> +	{ .n =3D  5, .k =3D  3,  .m =3D 14 /* 1.0714286*/ },
>> >> +	{ .n =3D  7, .k =3D  2,  .m =3D 13 /* 1.0769231*/ },
>> >> +	{ .n =3D  6, .k =3D  2,  .m =3D 11 /* 1.0909091*/ },
>> >> +	{ .n =3D  5, .k =3D  2,  .m =3D  9 /* 1.1111111*/ },
>> >> +	{ .n =3D  9, .k =3D  2,  .m =3D 16 /* 1.1250000*/ },
>> >> +	{ .n =3D  4, .k =3D  2,  .m =3D  7 /* 1.1428571*/ },
>> >> +	{ .n =3D  5, .k =3D  3,  .m =3D 13 /* 1.1538462*/ },
>> >> +	{ .n =3D  7, .k =3D  2,  .m =3D 12 /* 1.1666667*/ },
>> >> +	{ .n =3D  3, .k =3D  2,  .m =3D  5 /* 1.2000000*/ },
>> >> +	{ .n =3D  8, .k =3D  2,  .m =3D 13 /* 1.2307692*/ },
>> >> +	{ .n =3D  5, .k =3D  2,  .m =3D  8 /* 1.2500000*/ },
>> >> +	{ .n =3D  7, .k =3D  2,  .m =3D 11 /* 1.2727273*/ },
>> >> +	{ .n =3D  9, .k =3D  2,  .m =3D 14 /* 1.2857143*/ },
>> >> +	{ .n =3D  7, .k =3D  3,  .m =3D 16 /* 1.3125000*/ },
>> >> +	{ .n =3D  2, .k =3D  2,  .m =3D  3 /* 1.3333333*/ },
>> >> +	{ .n =3D  5, .k =3D  3,  .m =3D 11 /* 1.3636364*/ },
>> >> +	{ .n =3D 11, .k =3D  2,  .m =3D 16 /* 1.3750000*/ },
>> >> +	{ .n =3D  9, .k =3D  2,  .m =3D 13 /* 1.3846154*/ },
>> >> +	{ .n =3D  7, .k =3D  2,  .m =3D 10 /* 1.4000000*/ },
>> >> +	{ .n =3D  5, .k =3D  2,  .m =3D  7 /* 1.4285714*/ },
>> >> +	{ .n =3D  8, .k =3D  2,  .m =3D 11 /* 1.4545455*/ },
>> >> +	{ .n =3D 11, .k =3D  2,  .m =3D 15 /* 1.4666667*/ },
>> >> +	{ .n =3D  3, .k =3D  2,  .m =3D  4 /* 1.5000000*/ },
>> >> +	{ .n =3D 10, .k =3D  2,  .m =3D 13 /* 1.5384615*/ },
>> >> +	{ .n =3D  7, .k =3D  2,  .m =3D  9 /* 1.5555556*/ },
>> >> +	{ .n =3D 11, .k =3D  2,  .m =3D 14 /* 1.5714286*/ },
>> >> +	{ .n =3D  4, .k =3D  2,  .m =3D  5 /* 1.6000000*/ },
>> >> +	{ .n =3D  7, .k =3D  3,  .m =3D 13 /* 1.6153846*/ },
>> >> +	{ .n =3D 13, .k =3D  2,  .m =3D 16 /* 1.6250000*/ },
>> >> +	{ .n =3D  9, .k =3D  2,  .m =3D 11 /* 1.6363636*/ },
>> >> +	{ .n =3D  5, .k =3D  2,  .m =3D  6 /* 1.6666667*/ },
>> >> +	{ .n =3D  9, .k =3D  3,  .m =3D 16 /* 1.6875000*/ },
>> >> +	{ .n =3D 11, .k =3D  2,  .m =3D 13 /* 1.6923077*/ },
>> >> +	{ .n =3D  6, .k =3D  2,  .m =3D  7 /* 1.7142857*/ },
>> >> +	{ .n =3D 13, .k =3D  2,  .m =3D 15 /* 1.7333333*/ },
>> >> +	{ .n =3D  7, .k =3D  2,  .m =3D  8 /* 1.7500000*/ },
>> >> +	{ .n =3D  8, .k =3D  2,  .m =3D  9 /* 1.7777778*/ },
>> >> +	{ .n =3D  9, .k =3D  2,  .m =3D 10 /* 1.8000000*/ },
>> >> +	{ .n =3D 10, .k =3D  2,  .m =3D 11 /* 1.8181818*/ },
>> >> +	{ .n =3D 11, .k =3D  2,  .m =3D 12 /* 1.8333333*/ },
>> >> +	{ .n =3D 12, .k =3D  2,  .m =3D 13 /* 1.8461538*/ },
>> >> +	{ .n =3D 13, .k =3D  2,  .m =3D 14 /* 1.8571429*/ },
>> >> +	{ .n =3D 14, .k =3D  2,  .m =3D 15 /* 1.8666667*/ },
>> >> +	{ .n =3D 15, .k =3D  2,  .m =3D 16 /* 1.8750000*/ },
>> >> +	{ .n =3D  7, .k =3D  3,  .m =3D 11 /* 1.9090909*/ },
>> >> +	{ .n =3D  9, .k =3D  3,  .m =3D 14 /* 1.9285714*/ },
>> >> +	{ .n =3D  1, .k =3D  2,  .m =3D  1 /* 2.0000000*/ },
>> >> +	{ .n =3D 11, .k =3D  3,  .m =3D 16 /* 2.0625000*/ },
>> >> +	{ .n =3D  9, .k =3D  3,  .m =3D 13 /* 2.0769231*/ },
>> >> +	{ .n =3D  7, .k =3D  3,  .m =3D 10 /* 2.1000000*/ },
>> >> +	{ .n =3D 16, .k =3D  2,  .m =3D 15 /* 2.1333333*/ },
>> >> +	{ .n =3D 15, .k =3D  2,  .m =3D 14 /* 2.1428571*/ },
>> >> +	{ .n =3D 14, .k =3D  2,  .m =3D 13 /* 2.1538462*/ },
>> >> +	{ .n =3D 13, .k =3D  2,  .m =3D 12 /* 2.1666667*/ },
>> >> +	{ .n =3D 12, .k =3D  2,  .m =3D 11 /* 2.1818182*/ },
>> >> +	{ .n =3D 11, .k =3D  2,  .m =3D 10 /* 2.2000000*/ },
>> >> +	{ .n =3D 10, .k =3D  2,  .m =3D  9 /* 2.2222222*/ },
>> >> +	{ .n =3D  9, .k =3D  2,  .m =3D  8 /* 2.2500000*/ },
>> >> +	{ .n =3D  8, .k =3D  2,  .m =3D  7 /* 2.2857143*/ },
>> >> +	{ .n =3D 15, .k =3D  2,  .m =3D 13 /* 2.3076923*/ },
>> >> +	{ .n =3D  7, .k =3D  2,  .m =3D  6 /* 2.3333333*/ },
>> >> +	{ .n =3D 11, .k =3D  3,  .m =3D 14 /* 2.3571429*/ },
>> >> +	{ .n =3D 13, .k =3D  2,  .m =3D 11 /* 2.3636364*/ },
>> >> +	{ .n =3D  6, .k =3D  2,  .m =3D  5 /* 2.4000000*/ },
>> >> +	{ .n =3D 13, .k =3D  3,  .m =3D 16 /* 2.4375000*/ },
>> >> +	{ .n =3D 11, .k =3D  2,  .m =3D  9 /* 2.4444444*/ },
>> >> +	{ .n =3D  9, .k =3D  3,  .m =3D 11 /* 2.4545455*/ },
>> >> +	{ .n =3D 16, .k =3D  2,  .m =3D 13 /* 2.4615385*/ },
>> >> +	{ .n =3D  5, .k =3D  2,  .m =3D  4 /* 2.5000000*/ },
>> >> +	{ .n =3D 11, .k =3D  3,  .m =3D 13 /* 2.5384615*/ },
>> >> +	{ .n =3D 14, .k =3D  2,  .m =3D 11 /* 2.5454545*/ },
>> >> +	{ .n =3D  9, .k =3D  2,  .m =3D  7 /* 2.5714286*/ },
>> >> +	{ .n =3D 13, .k =3D  2,  .m =3D 10 /* 2.6000000*/ },
>> >> +	{ .n =3D  7, .k =3D  3,  .m =3D  8 /* 2.6250000*/ },
>> >> +	{ .n =3D  4, .k =3D  2,  .m =3D  3 /* 2.6666667*/ },
>> >> +	{ .n =3D  9, .k =3D  3,  .m =3D 10 /* 2.7000000*/ },
>> >> +	{ .n =3D 15, .k =3D  2,  .m =3D 11 /* 2.7272727*/ },
>> >> +	{ .n =3D 11, .k =3D  2,  .m =3D  8 /* 2.7500000*/ },
>> >> +	{ .n =3D 12, .k =3D  3,  .m =3D 13 /* 2.7692308*/ },
>> >> +	{ .n =3D 13, .k =3D  3,  .m =3D 14 /* 2.7857143*/ },
>> >> +	{ .n =3D  7, .k =3D  2,  .m =3D  5 /* 2.8000000*/ },
>> >> +	{ .n =3D 15, .k =3D  3,  .m =3D 16 /* 2.8125000*/ },
>> >> +	{ .n =3D 10, .k =3D  2,  .m =3D  7 /* 2.8571429*/ },
>> >> +	{ .n =3D 13, .k =3D  2,  .m =3D  9 /* 2.8888889*/ },
>> >> +	{ .n =3D 16, .k =3D  2,  .m =3D 11 /* 2.9090909*/ },
>> >> +	{ .n =3D 11, .k =3D  4,  .m =3D 15 /* 2.9333333*/ },
>> >> +	{ .n =3D  3, .k =3D  2,  .m =3D  2 /* 3.0000000*/ },
>> >> +	{ .n =3D 10, .k =3D  4,  .m =3D 13 /* 3.0769231*/ },
>> >> +	{ .n =3D 14, .k =3D  2,  .m =3D  9 /* 3.1111111*/ },
>> >> +	{ .n =3D 11, .k =3D  2,  .m =3D  7 /* 3.1428571*/ },
>> >> +	{ .n =3D  8, .k =3D  2,  .m =3D  5 /* 3.2000000*/ },
>> >> +	{ .n =3D 15, .k =3D  3,  .m =3D 14 /* 3.2142857*/ },
>> >> +	{ .n =3D 14, .k =3D  3,  .m =3D 13 /* 3.2307692*/ },
>> >> +	{ .n =3D 13, .k =3D  2,  .m =3D  8 /* 3.2500000*/ },
>> >> +	{ .n =3D 12, .k =3D  3,  .m =3D 11 /* 3.2727273*/ },
>> >> +	{ .n =3D 11, .k =3D  3,  .m =3D 10 /* 3.3000000*/ },
>> >> +	{ .n =3D  5, .k =3D  2,  .m =3D  3 /* 3.3333333*/ },
>> >> +	{ .n =3D  9, .k =3D  3,  .m =3D  8 /* 3.3750000*/ },
>> >> +	{ .n =3D 11, .k =3D  4,  .m =3D 13 /* 3.3846154*/ },
>> >> +	{ .n =3D 12, .k =3D  2,  .m =3D  7 /* 3.4285714*/ },
>> >> +	{ .n =3D 15, .k =3D  3,  .m =3D 13 /* 3.4615385*/ },
>> >> +	{ .n =3D 13, .k =3D  4,  .m =3D 15 /* 3.4666667*/ },
>> >> +	{ .n =3D  7, .k =3D  2,  .m =3D  4 /* 3.5000000*/ },
>> >> +	{ .n =3D 13, .k =3D  3,  .m =3D 11 /* 3.5454545*/ },
>> >> +	{ .n =3D 16, .k =3D  2,  .m =3D  9 /* 3.5555556*/ },
>> >> +	{ .n =3D  9, .k =3D  2,  .m =3D  5 /* 3.6000000*/ },
>> >> +	{ .n =3D 10, .k =3D  4,  .m =3D 11 /* 3.6363636*/ },
>> >> +	{ .n =3D 11, .k =3D  2,  .m =3D  6 /* 3.6666667*/ },
>> >> +	{ .n =3D 16, .k =3D  3,  .m =3D 13 /* 3.6923077*/ },
>> >> +	{ .n =3D 13, .k =3D  2,  .m =3D  7 /* 3.7142857*/ },
>> >> +	{ .n =3D 14, .k =3D  4,  .m =3D 15 /* 3.7333333*/ },
>> >> +	{ .n =3D 15, .k =3D  2,  .m =3D  8 /* 3.7500000*/ },
>> >> +	{ .n =3D 14, .k =3D  3,  .m =3D 11 /* 3.8181818*/ },
>> >> +	{ .n =3D  9, .k =3D  3,  .m =3D  7 /* 3.8571429*/ },
>> >> +	{ .n =3D 13, .k =3D  3,  .m =3D 10 /* 3.9000000*/ },
>> >> +	{ .n =3D  2, .k =3D  2,  .m =3D  1 /* 4.0000000*/ },
>> >> +	{ .n =3D 15, .k =3D  3,  .m =3D 11 /* 4.0909091*/ },
>> >> +	{ .n =3D 11, .k =3D  3,  .m =3D  8 /* 4.1250000*/ },
>> >> +	{ .n =3D  7, .k =3D  3,  .m =3D  5 /* 4.2000000*/ },
>> >> +	{ .n =3D 16, .k =3D  4,  .m =3D 15 /* 4.2666667*/ },
>> >> +	{ .n =3D 15, .k =3D  2,  .m =3D  7 /* 4.2857143*/ },
>> >> +	{ .n =3D 14, .k =3D  4,  .m =3D 13 /* 4.3076923*/ },
>> >> +	{ .n =3D 13, .k =3D  2,  .m =3D  6 /* 4.3333333*/ },
>> >> +	{ .n =3D 16, .k =3D  3,  .m =3D 11 /* 4.3636364*/ },
>> >> +	{ .n =3D 11, .k =3D  2,  .m =3D  5 /* 4.4000000*/ },
>> >> +	{ .n =3D 10, .k =3D  4,  .m =3D  9 /* 4.4444444*/ },
>> >> +	{ .n =3D  9, .k =3D  2,  .m =3D  4 /* 4.5000000*/ },
>> >> +	{ .n =3D 16, .k =3D  2,  .m =3D  7 /* 4.5714286*/ },
>> >> +	{ .n =3D 15, .k =3D  4,  .m =3D 13 /* 4.6153846*/ },
>> >> +	{ .n =3D  7, .k =3D  2,  .m =3D  3 /* 4.6666667*/ },
>> >> +	{ .n =3D 11, .k =3D  3,  .m =3D  7 /* 4.7142857*/ },
>> >> +	{ .n =3D 13, .k =3D  4,  .m =3D 11 /* 4.7272727*/ },
>> >> +	{ .n =3D 12, .k =3D  2,  .m =3D  5 /* 4.8000000*/ },
>> >> +	{ .n =3D 13, .k =3D  3,  .m =3D  8 /* 4.8750000*/ },
>> >> +	{ .n =3D 11, .k =3D  4,  .m =3D  9 /* 4.8888889*/ },
>> >> +	{ .n =3D 16, .k =3D  4,  .m =3D 13 /* 4.9230769*/ },
>> >> +	{ .n =3D  5, .k =3D  2,  .m =3D  2 /* 5.0000000*/ },
>> >> +	{ .n =3D 14, .k =3D  4,  .m =3D 11 /* 5.0909091*/ },
>> >> +	{ .n =3D 12, .k =3D  3,  .m =3D  7 /* 5.1428571*/ },
>> >> +	{ .n =3D 13, .k =3D  2,  .m =3D  5 /* 5.2000000*/ },
>> >> +	{ .n =3D  7, .k =3D  3,  .m =3D  4 /* 5.2500000*/ },
>> >> +	{ .n =3D  8, .k =3D  2,  .m =3D  3 /* 5.3333333*/ },
>> >> +	{ .n =3D  9, .k =3D  3,  .m =3D  5 /* 5.4000000*/ },
>> >> +	{ .n =3D 15, .k =3D  4,  .m =3D 11 /* 5.4545455*/ },
>> >> +	{ .n =3D 11, .k =3D  2,  .m =3D  4 /* 5.5000000*/ },
>> >> +	{ .n =3D 13, .k =3D  3,  .m =3D  7 /* 5.5714286*/ },
>> >> +	{ .n =3D 14, .k =3D  2,  .m =3D  5 /* 5.6000000*/ },
>> >> +	{ .n =3D 15, .k =3D  3,  .m =3D  8 /* 5.6250000*/ },
>> >> +	{ .n =3D 10, .k =3D  4,  .m =3D  7 /* 5.7142857*/ },
>> >> +	{ .n =3D 13, .k =3D  4,  .m =3D  9 /* 5.7777778*/ },
>> >> +	{ .n =3D 16, .k =3D  4,  .m =3D 11 /* 5.8181818*/ },
>> >> +	{ .n =3D  3, .k =3D  2,  .m =3D  1 /* 6.0000000*/ },
>> >> +	{ .n =3D 14, .k =3D  4,  .m =3D  9 /* 6.2222222*/ },
>> >> +	{ .n =3D 11, .k =3D  4,  .m =3D  7 /* 6.2857143*/ },
>> >> +	{ .n =3D 16, .k =3D  2,  .m =3D  5 /* 6.4000000*/ },
>> >> +	{ .n =3D 15, .k =3D  3,  .m =3D  7 /* 6.4285714*/ },
>> >> +	{ .n =3D 13, .k =3D  2,  .m =3D  4 /* 6.5000000*/ },
>> >> +	{ .n =3D 11, .k =3D  3,  .m =3D  5 /* 6.6000000*/ },
>> >> +	{ .n =3D 10, .k =3D  2,  .m =3D  3 /* 6.6666667*/ },
>> >> +	{ .n =3D  9, .k =3D  3,  .m =3D  4 /* 6.7500000*/ },
>> >> +	{ .n =3D 16, .k =3D  3,  .m =3D  7 /* 6.8571429*/ },
>> >> +	{ .n =3D  7, .k =3D  2,  .m =3D  2 /* 7.0000000*/ },
>> >> +	{ .n =3D 16, .k =3D  4,  .m =3D  9 /* 7.1111111*/ },
>> >> +	{ .n =3D 12, .k =3D  3,  .m =3D  5 /* 7.2000000*/ },
>> >> +	{ .n =3D 11, .k =3D  2,  .m =3D  3 /* 7.3333333*/ },
>> >> +	{ .n =3D 13, .k =3D  4,  .m =3D  7 /* 7.4285714*/ },
>> >> +	{ .n =3D 15, .k =3D  2,  .m =3D  4 /* 7.5000000*/ },
>> >> +	{ .n =3D 13, .k =3D  3,  .m =3D  5 /* 7.8000000*/ },
>> >> +	{ .n =3D  4, .k =3D  2,  .m =3D  1 /* 8.0000000*/ },
>> >> +	{ .n =3D 11, .k =3D  3,  .m =3D  4 /* 8.2500000*/ },
>> >> +	{ .n =3D 14, .k =3D  3,  .m =3D  5 /* 8.4000000*/ },
>> >> +	{ .n =3D 15, .k =3D  4,  .m =3D  7 /* 8.5714286*/ },
>> >> +	{ .n =3D 13, .k =3D  2,  .m =3D  3 /* 8.6666667*/ },
>> >> +	{ .n =3D 11, .k =3D  4,  .m =3D  5 /* 8.8000000*/ },
>> >> +	{ .n =3D  9, .k =3D  2,  .m =3D  2 /* 9.0000000*/ },
>> >> +	{ .n =3D 16, .k =3D  4,  .m =3D  7 /* 9.1428571*/ },
>> >> +	{ .n =3D 14, .k =3D  2,  .m =3D  3 /* 9.3333333*/ },
>> >> +	{ .n =3D 16, .k =3D  3,  .m =3D  5 /* 9.6000000*/ },
>> >> +	{ .n =3D 13, .k =3D  3,  .m =3D  4 /* 9.7500000*/ },
>> >> +	{ .n =3D  5, .k =3D  2,  .m =3D  1 /*10.0000000*/ },
>> >> +	{ .n =3D 13, .k =3D  4,  .m =3D  5 /*10.4000000*/ },
>> >> +	{ .n =3D  7, .k =3D  3,  .m =3D  2 /*10.5000000*/ },
>> >> +	{ .n =3D 16, .k =3D  2,  .m =3D  3 /*10.6666667*/ },
>> >> +	{ .n =3D 11, .k =3D  2,  .m =3D  2 /*11.0000000*/ },
>> >> +	{ .n =3D 14, .k =3D  4,  .m =3D  5 /*11.2000000*/ },
>> >> +	{ .n =3D 15, .k =3D  3,  .m =3D  4 /*11.2500000*/ },
>> >> +	{ .n =3D  6, .k =3D  2,  .m =3D  1 /*12.0000000*/ },
>> >> +	{ .n =3D 16, .k =3D  4,  .m =3D  5 /*12.8000000*/ },
>> >> +	{ .n =3D 13, .k =3D  2,  .m =3D  2 /*13.0000000*/ },
>> >> +	{ .n =3D 10, .k =3D  4,  .m =3D  3 /*13.3333333*/ },
>> >> +	{ .n =3D  9, .k =3D  3,  .m =3D  2 /*13.5000000*/ },
>> >> +	{ .n =3D  7, .k =3D  2,  .m =3D  1 /*14.0000000*/ },
>> >> +	{ .n =3D 11, .k =3D  4,  .m =3D  3 /*14.6666667*/ },
>> >> +	{ .n =3D 15, .k =3D  2,  .m =3D  2 /*15.0000000*/ },
>> >> +	{ .n =3D  8, .k =3D  2,  .m =3D  1 /*16.0000000*/ },
>> >> +	{ .n =3D 11, .k =3D  3,  .m =3D  2 /*16.5000000*/ },
>> >> +	{ .n =3D 13, .k =3D  4,  .m =3D  3 /*17.3333333*/ },
>> >> +	{ .n =3D  9, .k =3D  2,  .m =3D  1 /*18.0000000*/ },
>> >> +	{ .n =3D 14, .k =3D  4,  .m =3D  3 /*18.6666667*/ },
>> >> +	{ .n =3D 13, .k =3D  3,  .m =3D  2 /*19.5000000*/ },
>> >> +	{ .n =3D 10, .k =3D  2,  .m =3D  1 /*20.0000000*/ },
>> >> +	{ .n =3D  7, .k =3D  3,  .m =3D  1 /*21.0000000*/ },
>> >> +	{ .n =3D 16, .k =3D  4,  .m =3D  3 /*21.3333333*/ },
>> >> +	{ .n =3D 11, .k =3D  2,  .m =3D  1 /*22.0000000*/ },
>> >> +	{ .n =3D 15, .k =3D  3,  .m =3D  2 /*22.5000000*/ },
>> >> +	{ .n =3D 12, .k =3D  2,  .m =3D  1 /*24.0000000*/ },
>> >> +	{ .n =3D 13, .k =3D  2,  .m =3D  1 /*26.0000000*/ },
>> >> +	{ .n =3D  9, .k =3D  3,  .m =3D  1 /*27.0000000*/ },
>> >> +	{ .n =3D 14, .k =3D  2,  .m =3D  1 /*28.0000000*/ },
>> >> +	{ .n =3D 15, .k =3D  2,  .m =3D  1 /*30.0000000*/ },
>> >> +	{ .n =3D 16, .k =3D  2,  .m =3D  1 /*32.0000000*/ },
>> >> +	{ .n =3D 11, .k =3D  3,  .m =3D  1 /*33.0000000*/ },
>> >> +	{ .n =3D 12, .k =3D  3,  .m =3D  1 /*36.0000000*/ },
>> >> +	{ .n =3D 13, .k =3D  3,  .m =3D  1 /*39.0000000*/ },
>> >> +	{ .n =3D 10, .k =3D  4,  .m =3D  1 /*40.0000000*/ },
>> >> +	{ .n =3D 14, .k =3D  3,  .m =3D  1 /*42.0000000*/ },
>> >> +	{ .n =3D 11, .k =3D  4,  .m =3D  1 /*44.0000000*/ },
>> >> +	{ .n =3D 15, .k =3D  3,  .m =3D  1 /*45.0000000*/ },
>> >> +	{ .n =3D 16, .k =3D  3,  .m =3D  1 /*48.0000000*/ },
>> >> +	{ .n =3D 13, .k =3D  4,  .m =3D  1 /*52.0000000*/ },
>> >> +	{ .n =3D 14, .k =3D  4,  .m =3D  1 /*56.0000000*/ },
>> >> +	{ .n =3D 15, .k =3D  4,  .m =3D  1 /*60.0000000*/ },
>> >> +	{ .n =3D 16, .k =3D  4,  .m =3D  1 /*64.0000000*/ },
>> >> +};
>> >
>> > This can be turned into a test generator.
>>
>> Sure.
>>
>> > Also, these are the valid NKM
>> > combinations, but for a single clock, not all possible NKM clocks,
>> > right?
>>
>> Right. These are the combinations for the A64's pll-mipi.
>>
>> >> +static void ccu_nkm_test_helper_check_register(struct kunit *test, s=
truct ccu_nkm *nkm, u32 reg,
>> >> +					       unsigned long n, unsigned long k, unsigned long m)
>> >> +{
>> >> +	unsigned long n_a, k_a, m_a;
>> >> +
>> >> +	n_a =3D ((reg & GENMASK(nkm->n.width + nkm->n.shift - 1, nkm->n.shi=
ft)) >> nkm->n.shift) + 1;
>> >> +	KUNIT_EXPECT_EQ(test, n, n_a);
>> >> +	k_a =3D ((reg & GENMASK(nkm->k.width + nkm->k.shift - 1, nkm->k.shi=
ft)) >> nkm->k.shift) + 1;
>> >> +	KUNIT_EXPECT_EQ(test, k, k_a);
>> >> +	m_a =3D ((reg & GENMASK(nkm->m.width + nkm->m.shift - 1, nkm->m.shi=
ft)) >> nkm->m.shift) + 1;
>> >> +	KUNIT_EXPECT_EQ(test, m, m_a);
>> >> +}
>> >> +
>> >> +static int ccu_nkm_test_suite_init(struct kunit_suite *suite)
>> >> +{
>> >> +	WARN_ON(logic_iomem_add_region(&virt_ccu_iomem_resource,
>> >> +				       &virt_ccu_iomem_map_ops));
>> >> +	return 0;
>> >> +}
>> >> +
>> >> +static int ccu_nkm_test_init(struct kunit *test)
>> >> +{
>> >> +	struct ccu_nkm_test_context *ctx;
>> >> +	int ret;
>> >> +	struct ccu_nkm nkm_clk =3D {
>> >> +		.enable		=3D BIT(31) | BIT(23) | BIT(22),
>> >> +		.lock		=3D BIT(28),
>> >> +		.n		=3D _SUNXI_CCU_MULT(8, 4),
>> >> +		.k		=3D _SUNXI_CCU_MULT_MIN(4, 2, 2),
>> >> +		.m		=3D _SUNXI_CCU_DIV(0, 4),
>> >> +		.common		=3D {
>> >> +			.reg		=3D NKM_REGISTER,
>> >> +			.hw.init	=3D CLK_HW_INIT("test-nkm", "test-nkm-parent",
>> >> +						&ccu_nkm_ops,
>> >> +						CLK_SET_RATE_UNGATE),
>> >> +		},
>> >> +	};
>> >> +
>> >> +	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
>> >> +	if (!ctx)
>> >> +		return -ENOMEM;
>> >> +	test->priv =3D ctx;
>> >> +
>> >> +	ctx->ccu_iomem =3D ioremap(CCU_IOMEM_START, CCU_IOMEM_SIZE);
>> >> +	nkm_clk.common.base =3D ctx->ccu_iomem;
>> >> +
>> >> +	ctx->parent_hw.init =3D CLK_HW_INIT_NO_PARENT("test-nkm-parent", &c=
lk_parent_rate_ops, 0);
>> >> +	ctx->parent_multiplier =3D 8;
>> >> +
>> >> +	ret =3D clk_hw_register(NULL, &ctx->parent_hw);
>> >> +	if (ret)
>> >> +		return ret;
>> >> +
>> >> +	ctx->nkm_clk =3D nkm_clk;
>> >> +	ret =3D clk_hw_register(NULL, &ctx->nkm_clk.common.hw);
>> >> +	if (ret)
>> >> +		return ret;
>> >> +
>> >> +	/*
>> >> +	 * HACK: Setting the lock bit during initialization, because the nk=
m clock waits for it
>> >> +	 *       after setting the rate.
>> >> +	 */
>> >> +	ctx->reg =3D ctx->nkm_clk.lock;
>> >> +
>> >> +	return 0;
>> >> +}
>> >> +
>> >> +static void ccu_nkm_test_exit(struct kunit *test)
>> >> +{
>> >> +	struct ccu_nkm_test_context *ctx =3D test->priv;
>> >> +
>> >> +	clk_hw_unregister(&ctx->nkm_clk.common.hw);
>> >> +	clk_hw_unregister(&ctx->parent_hw);
>> >> +	iounmap(ctx->ccu_iomem);
>> >> +}
>> >> +
>> >> +/*
>> >> + * Test that the nkm clock provides the target rate if it is a rate =
that it can actually provide.
>> >> + */
>> >> +static void ccu_nkm_test_set_rate_exact(struct kunit *test)
>> >> +{
>> >> +	struct ccu_nkm_test_context *ctx =3D test->priv;
>> >> +	int ret;
>> >> +	unsigned long target_rate, expected_rate, actual_rate;
>> >> +	size_t num, i;
>> >> +
>> >> +	num =3D ARRAY_SIZE(all_nkm_combos);
>> >> +	KUNIT_ASSERT_GT(test, num, 0);
>> >> +
>> >> +	for (i =3D 0; i < num; i++) {
>> >> +		target_rate =3D ctx->parent_multiplier * PARENT_CLOCK_BASE_RATE *
>> >> +			      all_nkm_combos[i].n * all_nkm_combos[i].k / all_nkm_combos[=
i].m;
>> >> +
>> >> +		expected_rate =3D target_rate;
>> >> +
>> >> +		ret =3D clk_set_rate(ctx->nkm_clk.common.hw.clk, target_rate);
>> >> +		KUNIT_EXPECT_EQ(test, 0, ret);
>> >> +		actual_rate =3D clk_get_rate(ctx->nkm_clk.common.hw.clk);
>> >> +		KUNIT_EXPECT_EQ(test, expected_rate, actual_rate);
>> >> +		ccu_nkm_test_helper_check_register(test, &ctx->nkm_clk, ctx->reg,
>> >> +						   all_nkm_combos[i].n, all_nkm_combos[i].k,
>> >> +						   all_nkm_combos[i].m);
>> >> +	}
>> >> +}
>> >> +
>> >> +/*
>> >> + * Test that the nkm clock rounds down when the target rate is sligh=
tly (1 Hz) higher, than a rate
>> >> + * that it can actually provide.
>> >> + */
>> >> +static void ccu_nkm_test_set_rate_round_down_higher(struct kunit *te=
st)
>> >> +{
>> >> +	struct ccu_nkm_test_context *ctx =3D test->priv;
>> >> +	int ret;
>> >> +	unsigned long target_rate, expected_rate, actual_rate;
>> >> +	size_t num, i;
>> >> +
>> >> +	num =3D ARRAY_SIZE(all_nkm_combos);
>> >> +	KUNIT_ASSERT_GT(test, num, 0);
>> >> +
>> >> +	for (i =3D 0; i < num; i++) {
>> >> +		target_rate =3D ctx->parent_multiplier * PARENT_CLOCK_BASE_RATE *
>> >> +			      all_nkm_combos[i].n * all_nkm_combos[i].k / all_nkm_combos[=
i].m + 1;
>> >> +		expected_rate =3D target_rate - 1;
>> >> +
>> >> +		ret =3D clk_set_rate(ctx->nkm_clk.common.hw.clk, target_rate);
>> >> +		KUNIT_EXPECT_EQ(test, 0, ret);
>> >> +		actual_rate =3D clk_get_rate(ctx->nkm_clk.common.hw.clk);
>> >> +		KUNIT_EXPECT_EQ(test, expected_rate, actual_rate);
>> >> +		ccu_nkm_test_helper_check_register(test, &ctx->nkm_clk, ctx->reg,
>> >> +						   all_nkm_combos[i].n, all_nkm_combos[i].k,
>> >> +						   all_nkm_combos[i].m);
>> >> +	}
>> >> +}
>> >> +
>> >> +/*
>> >> + * Test that the nkm clock also rounds down when the target rate is =
slightly (1 Hz) lower, than the
>> >> + * next higher rate that it can actually provide.
>> >> + */
>> >> +static void ccu_nkm_test_set_rate_round_down_lower(struct kunit *tes=
t)
>> >> +{
>> >> +	struct ccu_nkm_test_context *ctx =3D test->priv;
>> >> +	int ret;
>> >> +	unsigned long target_rate, expected_rate, actual_rate;
>> >> +	size_t num, i;
>> >> +
>> >> +	num =3D ARRAY_SIZE(all_nkm_combos);
>> >> +	KUNIT_ASSERT_GT(test, num, 0);
>> >> +
>> >> +	/*
>> >> +	 * The nkm clock does not support overshooting, therefore, always e=
xpect the previous
>> >> +	 * combination. That means, we need to start the loop at index 1.
>> >> +	 *
>> >> +	 * This leaves us with the special case of what happens if we reque=
st a rate that is lower
>> >> +	 * than the lowest supported rate. We'll handle that case after the=
 loop.
>> >> +	 */
>> >> +	for (i =3D 1; i < num; i++) {
>> >> +		size_t i_e =3D i - 1; /* index of the expected rate */
>> >> +
>> >> +		target_rate =3D ctx->parent_multiplier * PARENT_CLOCK_BASE_RATE *
>> >> +			      all_nkm_combos[i].n * all_nkm_combos[i].k / all_nkm_combos[=
i].m - 1;
>> >> +
>> >> +		expected_rate =3D ctx->parent_multiplier * PARENT_CLOCK_BASE_RATE *
>> >> +				all_nkm_combos[i_e].n * all_nkm_combos[i_e].k /
>> >> +				all_nkm_combos[i_e].m;
>> >> +
>> >> +		ret =3D clk_set_rate(ctx->nkm_clk.common.hw.clk, target_rate);
>> >> +		KUNIT_EXPECT_EQ(test, 0, ret);
>> >> +		actual_rate =3D clk_get_rate(ctx->nkm_clk.common.hw.clk);
>> >> +		KUNIT_EXPECT_EQ(test, expected_rate, actual_rate);
>> >> +		ccu_nkm_test_helper_check_register(test, &ctx->nkm_clk, ctx->reg,
>> >> +						   all_nkm_combos[i_e].n, all_nkm_combos[i_e].k,
>> >> +						   all_nkm_combos[i_e].m);
>> >> +	}
>> >> +
>> >> +	/*
>> >> +	 * Request a rate 1 Hz lower than the lowest supported rate: Expect=
 the clock to complain
>> >> +	 * about it.
>> >> +	 */
>> >> +	target_rate =3D ctx->parent_multiplier * PARENT_CLOCK_BASE_RATE *
>> >> +			all_nkm_combos[0].n * all_nkm_combos[0].k / all_nkm_combos[0].m -=
 1;
>> >> +	ret =3D clk_set_rate(ctx->nkm_clk.common.hw.clk, target_rate);
>> >> +	KUNIT_EXPECT_EQ(test, -EINVAL, ret);
>> >> +}
>> >
>> > I'm also not certain that it's worth testing every possible coeff the
>> > clock supports. This feels like we're focusing on the wrong thing and
>> > I'd focus on what it's going to be useful for.
>> >
>> > Like, we're testing for a video clock here, with multiple parents it c=
an
>> > also change the rate of. It would make much more sense to me to have t=
he
>> > list of all possible video clocks (let's say based on the VESA timings
>> > pixel clocks) and make sure that for one possible rate, the proper
>> > parent is muxed in at the proper rate.
>> >
>> > Here you're doing some integration testing, but without any actual
>> > integration and rather focus on getting one of the components super
>> > reliable but completely ignoring all the others.
>>
>> You are absolutely right! My plan is to model the A64's video0 subtree
>> to make sure that I don't break anything. But I've got to start
>> somewhere.
>
> The more I think about it, the more I think we should be doing this in
> qemu + a script. IIRC the clock debugfs support allows to trigger a
> clk_set_rate from userspace, so it should be fairly easy to boot a
> kernel and test from userspace if the rate is correct, the parents are
> correct, etc, even at the register level.
>
> Maxime
>
> [[End of PGP Signed Part]]
