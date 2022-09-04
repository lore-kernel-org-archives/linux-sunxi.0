Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5CE3C02
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Sep 2022 20:16:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 2F66CD108D
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Sep 2022 20:11:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 74875FF804;
	Sun,  4 Sep 2022 20:10:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
	(envelope-from <peter@korsgaard.com>)
	id 1oUvxD-005rMX-Lq; Sun, 04 Sep 2022 22:10:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: <Conor.Dooley@microchip.com>
Cc: <samuel@sholland.org>,  <wens@csie.org>,  <jernej.skrabec@gmail.com>,
  <linux-sunxi@lists.linux.dev>,  <palmer@dabbelt.com>,
  <paul.walmsley@sifive.com>,  <aou@eecs.berkeley.edu>,
  <linux-riscv@lists.infradead.org>,  <robh+dt@kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <krzysztof.kozlowski+dt@linaro.org>,  <heiko@sntech.de>
Subject: Re: [PATCH 07/12] riscv: dts: allwinner: Add Allwinner D1 Nezha
 devicetree
References: <20220815050815.22340-1-samuel@sholland.org>
	<20220815050815.22340-8-samuel@sholland.org>
	<adc4a8e2-7347-7616-99b9-59762023b2ff@microchip.com>
Date: Sun, 04 Sep 2022 22:10:51 +0200
In-Reply-To: <adc4a8e2-7347-7616-99b9-59762023b2ff@microchip.com> (Conor
	Dooley's message of "Fri, 19 Aug 2022 22:10:44 +0000")
Message-ID: <87o7vuzyr8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

>>>>>   <Conor.Dooley@microchip.com> writes:

 > Hey Samuel,
 > Finally got around to giving this a go with the fix for loading
 > modules which is mostly what was blocking me before..

 > On 15/08/2022 06:08, Samuel Holland wrote:
 >> "D1 Nezha" is Allwinner's first-party development board for the D1 SoC.
 >> It was shipped with 512M, 1G, or 2G of DDR3. It supports onboard audio,

 > I am really not keen on the way you have things, with the memory
 > nodes removed from the device tree. I know your preferred flow
 > for booting these things might be to pass the dtb up from U-Boot,
 > but I think the devicetree in the kernel should be usable in a
 > standalone manner, even if that is the barest-minimum memory
 > config.

Yes, this also confused me. Part of the reason seems to be that u-boot
on RISC-V doesn't fixup the memory node of a provided device tree like
it is done on E.G. ARM for some reason.

-- 
Bye, Peter Korsgaard
