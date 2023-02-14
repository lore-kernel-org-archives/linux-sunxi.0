Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AFE15A8
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Feb 2023 00:20:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F6081AED;
	Mon, 13 Feb 2023 16:20:57 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D849C3F663;
	Mon, 13 Feb 2023 16:20:12 -0800 (PST)
Date: Tue, 14 Feb 2023 00:18:05 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Bastian Germann <bage@debian.org>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>, Ohad Ben-Cohen
 <ohad@wizery.com>, Bjorn Andersson <andersson@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai
 <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] Enable hwlock on Allwinner A64
Message-ID: <20230214001805.6ead683d@slackpad.lan>
In-Reply-To: <20230213231931.6546-1-bage@debian.org>
References: <20230213231931.6546-1-bage@debian.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Feb 2023 00:19:27 +0100
Bastian Germann <bage@debian.org> wrote:

Hi Bastian,

> The allwinner,sun6i-a31-hwspinlock compatible driver can be used with
> the Allwinner A64 chip. Add the wiring required to enable it.
> 
> The device tree schema needs some work to verify everything that is
> needed by the sun6i hwlock driver.
> 
> The hwlock device was verified to be available with this series applied
> on a Pinebook.

The changes look fine, but are there any actual users of this device?
The missing binding bits you fixed demonstrate that a driver/binding
without actual users can create problems.
So are there Linux/Crust patches out there that use this device?

Cheers,
Andre

> 
> Bastian Germann (3):
>   dt-bindings: hwlock: sun6i: Add missing #hwlock-cells
>   dt-bindings: hwlock: sun6i: Add missing names
>   arm64: dts: allwinner: a64: Add hwspinlock node
> 
>  .../hwlock/allwinner,sun6i-a31-hwspinlock.yaml     | 14 ++++++++++++++
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      | 10 ++++++++++
>  2 files changed, 24 insertions(+)
> 

