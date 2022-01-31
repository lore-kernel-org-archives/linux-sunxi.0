Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C817F29CA
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 12:57:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F27CD6E;
	Mon, 31 Jan 2022 04:57:50 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D6FD3F774;
	Mon, 31 Jan 2022 04:57:49 -0800 (PST)
Date: Mon, 31 Jan 2022 12:57:46 +0000
From: Andre Przywara <andre.przywara@foss.arm.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Jesse Taube <mr.bossman075@gmail.com>, Samuel Holland
 <samuel@sholland.org>, George Hilliard <thirtythreeforty@gmail.com>, Chris
 Morgan <macroalpha82@gmail.com>, U-Boot Mailing List
 <u-boot@lists.denx.de>, linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: Please test U-Boot Allwinner F1C100s support
Message-ID: <20220131125746.4702fac0@donnerap.cambridge.arm.com>
In-Reply-To: <4e706b47-f3df-9a1d-60ba-c072a05e0fa0@benettiengineering.com>
References: <2ba1e2bb-e65d-8b79-dad9-1698b2dc6d12@gmail.com>
	<05FF11BA-A37F-4A89-A30B-96EDA15DD469@benettiengineering.com>
	<4e706b47-f3df-9a1d-60ba-c072a05e0fa0@benettiengineering.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Jan 2022 13:17:52 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Hi All,
> 
> I've tried several times on both F1C100s and F1C200s, maybe I'm doing 
> something wrong but it doesn't work :-/
> 
> I burn sd-card with:
> # sudo dd if=u-boot-sunxi-with-spl.bin of=/dev/sdb bs=1k seek=8
> 
> I've triple-checked that the file has been written there by dumping the 
> sd-card and I see it's written at 0x2000, so 8K offset, like the mangoPI 
> image for example. But no uart output.

I haven't looked in detail what would be needed for the SPL part of the
MMC driver to really work, I just checked that the base addresses are
correct, the pinmux looked alright as well.
The DT nodes are not needed for the SPL, and I don't see other changes
related to MMC in the original series?
Do you see UART output from the SPL, or nothing at all?
And you are not using UART0 on the PortF pins, so multiplexed with the
MMC, I guess?

Cheers,
Andre



> 
> Am I doing something wrong?
> 
> Best regards

