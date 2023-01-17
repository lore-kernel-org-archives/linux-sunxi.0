Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2824C9A
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Jan 2023 16:14:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCE34AD7;
	Tue, 17 Jan 2023 08:14:44 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C54893F67D;
	Tue, 17 Jan 2023 08:14:01 -0800 (PST)
Date: Tue, 17 Jan 2023 16:13:59 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Sergei Antonov <saproj@gmail.com>
Cc: Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev, Samuel Holland
 <samuel@sholland.org>
Subject: Re: [PATCH] ns16550: Fix DM serial operation with non-DM SPL
Message-ID: <20230117161359.358ae7a3@donnerap.cambridge.arm.com>
In-Reply-To: <CABikg9w9U28WMY9rS8dQwKpz9qnNu5i2_270U=SOLmHf=ZXw=w@mail.gmail.com>
References: <20230117120938.818180-1-andre.przywara@arm.com>
	<CABikg9w9U28WMY9rS8dQwKpz9qnNu5i2_270U=SOLmHf=ZXw=w@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Jan 2023 16:12:54 +0300
Sergei Antonov <saproj@gmail.com> wrote:

Hi Sergei,

> On Tue, 17 Jan 2023 at 15:10, Andre Przywara <andre.przywara@arm.com> wrote:
> 
> > -#if CONFIG_IS_ENABLED(DM_SERIAL) && !defined(CONFIG_SYS_NS16550_REG_SIZE)
> > +#if CONFIG_IS_ENABLED(DM_SERIAL)
> >  /*
> >   * For driver model we always use one byte per register, and sort out the
> >   * differences in the driver
> >   */
> > +#undef CONFIG_SYS_NS16550_REG_SIZE
> >  #define CONFIG_SYS_NS16550_REG_SIZE (-1)
> >  #endif  
> 
> What if I have DM_SERIAL and a 16550 UART with 32-bit registers?

So does that break for you?
Because it should still work, I think, since (as the comment says) we just
use the struct to get the register *number*. The actual register size is
worked out from the DT, and multiplied in later.

> Before 9591b63531fa the register size of 8 was enforced for DM_SERIAL.

8? Or 4?
What does your reg-shift DT property say? Is that in your DT?

Cheers,
Andre

