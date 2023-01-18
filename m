Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DD62F3A
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Jan 2023 13:08:50 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id s3so11374444edd.4
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Jan 2023 05:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+FkdfQ0fyy8oVzUDZDPeWUAEndzhLODiAT1YO6vczEI=;
        b=M8qMGHfSzio7TVODAUC6VTEuyGN6hqibVWCZ6+YQvENbbFIwPNaFREUJnu0RSrYQyw
         yJg5EMhaPrf7f4/7tSbTYbOSjArRKcWrmwOapebwdPZEM2STKYJ9B90PMw4SjhKdaDxR
         xZ9ONLY19gE88//jbbpE21Nw2xCIYTGyAk9EnWrZPdaY5S9MWWvfQ0mKLeDYohGPUi2O
         hUMAOlhkMqjspPJIcxDIKy8pQDuN7TXmcWEin2EMkE3LsfjhMVVj0S4Q4LU33zwc2Wi2
         hizmaTYKqFNfXVt8eWeW3U2wULIBY/Bzn6w4f42+IxdnnXFW1xpL/d+JDOHF9ZeRvo2w
         SdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FkdfQ0fyy8oVzUDZDPeWUAEndzhLODiAT1YO6vczEI=;
        b=AHXuzFI8pKyY6MatQrtHIcISveNY8J7z5Yrl+rmPeDFkum/0nr4/CJF9hJmyHXDYll
         +YLMgXSlXCszpjhJCgvVx0e6Q9D3cP0snhfZkbeLtencjofwNNrN8b7tYz/JXj/vnmrX
         82s8hVagDcaCgclWmOj2agYxtF9AxmNl4OGAsHl/WQhkbwQmu8ZIDxPl+SQFQLVP7Qm+
         XAwvqeiefezb9r3NEKLtwSp4FW93T4Vt9huKp3PN2ZeZZUHuK06A2cSP3Dlm0iG5iJKw
         O2iQ28ZhuDp+ixfzSfaSZUnEiwZMQuy8SlFaIZcDzIdvPHESKEPLgVXHLak20qnLMy4D
         8cCw==
X-Gm-Message-State: AFqh2krkyo+ZYxMh/uUbvoMap1vx3+2rdtituiLb7e/Jnhnh9CbUhaG1
	YtVHAPKBdvktpYQTqVs+LiuiTx/h3mvn84+cp5s=
X-Google-Smtp-Source: AMrXdXs3/ShMk+rup+nsxLYfxuOtV25mGhZ+jUgYdubUfxZX1G4/vliEZaxgF8ojdWa6Jy1hNpH5fshzZCBtbRxfMUg=
X-Received: by 2002:aa7:d29a:0:b0:49e:61:fe4d with SMTP id w26-20020aa7d29a000000b0049e0061fe4dmr784569edq.192.1674047328332;
 Wed, 18 Jan 2023 05:08:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230117120938.818180-1-andre.przywara@arm.com>
 <CABikg9w9U28WMY9rS8dQwKpz9qnNu5i2_270U=SOLmHf=ZXw=w@mail.gmail.com> <20230117161359.358ae7a3@donnerap.cambridge.arm.com>
In-Reply-To: <20230117161359.358ae7a3@donnerap.cambridge.arm.com>
From: Sergei Antonov <saproj@gmail.com>
Date: Wed, 18 Jan 2023 16:08:37 +0300
Message-ID: <CABikg9xq7TJLqhJ8VWjU-eToTkB=OXWzN6inrM0vkh5XEz1NJw@mail.gmail.com>
Subject: Re: [PATCH] ns16550: Fix DM serial operation with non-DM SPL
To: Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, 
	linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jan 2023 at 19:14, Andre Przywara <andre.przywara@arm.com> wrote:
>
> On Tue, 17 Jan 2023 16:12:54 +0300
> Sergei Antonov <saproj@gmail.com> wrote:
>
> Hi Sergei,
>
> > On Tue, 17 Jan 2023 at 15:10, Andre Przywara <andre.przywara@arm.com> wrote:
> >
> > > -#if CONFIG_IS_ENABLED(DM_SERIAL) && !defined(CONFIG_SYS_NS16550_REG_SIZE)
> > > +#if CONFIG_IS_ENABLED(DM_SERIAL)
> > >  /*
> > >   * For driver model we always use one byte per register, and sort out the
> > >   * differences in the driver
> > >   */
> > > +#undef CONFIG_SYS_NS16550_REG_SIZE
> > >  #define CONFIG_SYS_NS16550_REG_SIZE (-1)
> > >  #endif
> >
> > What if I have DM_SERIAL and a 16550 UART with 32-bit registers?
>
> So does that break for you?
> Because it should still work, I think, since (as the comment says) we just
> use the struct to get the register *number*. The actual register size is
> worked out from the DT, and multiplied in later.
>
> > Before 9591b63531fa the register size of 8 was enforced for DM_SERIAL.
>
> 8? Or 4?

Oh, I meant 8-bit. So under DM_SERIAL:
CONFIG_SYS_NS16550_REG_SIZE is -1
UART_REG(x) is unsigned char x

> What does your reg-shift DT property say? Is that in your DT?

I did not have "reg-shift" property. Thanks for telling about it. Now
that I have these properties in DT my UART works.
  reg-io-width = <4>;
  reg-shift = <2>;

I also had to add this config parameter to make debug uart work:
CONFIG_DEBUG_UART_SHIFT=2

Thanks!
