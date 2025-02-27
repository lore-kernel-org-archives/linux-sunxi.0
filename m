Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B1A374F1
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Feb 2025 11:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740656810; cv=none; b=m3IpQe1ol+X71AeZjdHIcCnn/9NvOsMpv+1+9dwi8VhSuvOT5SJdB+da3BERRYLdMKpVxBaTvrdg4ewsQOM8wQ7U8wPTCGzxN3M2GdKpjG9x/3ktR/OK1y1GK7ynP2LvohndFkd4+37UXn62pLhmpI40hR6Jq7fuxaLvrH2bXn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740656810; c=relaxed/simple;
	bh=fbJlN7jitHcpATJIzTdtSIk8V9emdxHiUWGjROlMWy0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G/BH0+TY6GpQTHceTNvVLhrNQYFiEaGdLM+pgyivEcTnesfmCSDKLEpPId7x0UiMIMejk422CEpScyFr6L6zqKGhyLZ1fzhvBTK5aylZAoKIFSEvmqIawE75meNYz/s0OUdtMneYLQ27Z8J6aS07if0cW+Mb/226zZS1lyKsq10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F48F15A1;
	Thu, 27 Feb 2025 03:47:02 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F9093F6A8;
	Thu, 27 Feb 2025 03:46:44 -0800 (PST)
Date: Thu, 27 Feb 2025 11:46:42 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] pinctrl: sunxi: allow reading mux values from DT
Message-ID: <20250227114642.28752709@donnerap.manchester.arm.com>
In-Reply-To: <12609538.O9o76ZdvQC@jernej-laptop>
References: <20250214003734.14944-1-andre.przywara@arm.com>
	<20250214003734.14944-6-andre.przywara@arm.com>
	<12609538.O9o76ZdvQC@jernej-laptop>
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

On Tue, 18 Feb 2025 18:09:09 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Dne petek, 14. februar 2025 ob 01:37:31 Srednjeevropski standardni =C4=8D=
as je Andre Przywara napisal(a):
> > So far every Allwinner SoC needs a large table in the kernel code, to
> > describe the mapping between the pinctrl function names ("uart") and
> > the actual pincontroller mux value to be written into the registers.
> > This adds a lot of data into a single image kernel, and also looks
> > somewhat weird, as the DT can easily store the mux value.
> >=20
> > Add some code that allows to avoid that table: the struct that describes
> > the existing pins will be build at *runtime*, based on very basic
> > information provided by the respective SoC's pinctrl driver. This
> > consists of the number of pins per bank, plus information which bank
> > provides IRQ support, along with the mux value to use for that.
> > The code will then iterate over all children of the pincontroller DT
> > node (which describe each pin group), and populate that struct with the
> > mapping between function names and mux values. The only thing that needs
> > adding in the DT is a property with that value, per pin group.
> >=20
> > When this table is built, it will be handed over to the existing sunxi
> > pinctrl driver, which cannot tell a difference between a hardcoded
> > struct and this new one built at runtime. It will take care of
> > registering the pinctrl device with the pinctrl subsystem.
> >=20
> > All a new SoC driver would need to do is to provide two arrays, and then
> > call the sunxi_pinctrl_dt_table_init() function.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com> =20
>=20
> I went through the code and it makes sense.

Many thanks, that's much appreciated!

> I wonder if we really need to
> build whole table instead of having on demand lookups into DT. However,
> for now, this will do. So:

I agree that would make some sense, but is also quite a departure from the
current driver, which we have been using for more than a decade now. And I
guess that would mean that we would need to maintain the two approaches,
for the old SoCs, and the new ones? With that patch here generic changes
can be applied just to the one core driver, dealing with the pinctrl
subsystem.

> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Thanks,
Andre

> Thanks!
>=20
> Best regards,
> Jernej
>=20
