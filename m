Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABEB7E
	for <linux-sunxi@lists.linux.dev>; Sat,  3 Sep 2022 15:25:44 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 85ED6C0E1B
	for <linux-sunxi@lists.linux.dev>; Sat,  3 Sep 2022 15:21:32 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1FF3C1BF207;
	Sat,  3 Sep 2022 15:21:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
	(envelope-from <peter@korsgaard.com>)
	id 1oUUxS-002V0V-Mt; Sat, 03 Sep 2022 17:21:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  linux-sunxi@lists.linux.dev,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Paul Walmsley <paul.walmsley@sifive.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  linux-riscv@lists.infradead.org,  Rob Herring
 <robh+dt@kernel.org>,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 07/12] riscv: dts: allwinner: Add Allwinner D1 Nezha
 devicetree
References: <20220815050815.22340-1-samuel@sholland.org>
	<20220815050815.22340-8-samuel@sholland.org>
Date: Sat, 03 Sep 2022 17:21:18 +0200
In-Reply-To: <20220815050815.22340-8-samuel@sholland.org> (Samuel Holland's
	message of "Mon, 15 Aug 2022 00:08:10 -0500")
Message-ID: <87sfl8zdox.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

>>>>> "Samuel" == Samuel Holland <samuel@sholland.org> writes:

 > "D1 Nezha" is Allwinner's first-party development board for the D1 SoC.
 > It was shipped with 512M, 1G, or 2G of DDR3. It supports onboard audio,
 > HDMI, gigabit Ethernet, WiFi and Bluetooth, USB 2.0 host and OTG ports,
 > plus low-speed I/O from the SoC and a GPIO expander chip.

 > Most other D1 boards copied the Nezha's power tree, with the 1.8V rail
 > powered by the SoCs internal LDOA, analog domains powered by ALDO, and
 > the rest of the board powered by always-on fixed regulators. Some (but
 > not all) boards also copied the PWM CPU regulator. To avoid duplication,
 > factor out the out the regulator references that are common across all

NIT: s/out the out the/out the/

-- 
Bye, Peter Korsgaard
