Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071CD1632DA
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Nov 2024 04:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731559580; cv=none; b=RTBfqss2WEKnSRxJITwNFFFpzOX/FsGZcIpUSg7jlzxAjHYL+nreL7vkYl/MQ9kEv2QfrO8FMalvv5OZeZp4RcOO1TE/tvd2cuDnFOT4g3W3169tZvJIHjehtYyr2P7GWCNRWu3nUCG00zkSZ0CITOAoGkS+Qnuu01M/l45F/Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731559580; c=relaxed/simple;
	bh=Ls63W1NkqHjf52ZrqyGJlw3Lda8aWU1ZVvnWQTTJ3tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVcI/xd8aUlzLN7uSCg1kNt8MCJWDYYAi95I11OJF/4rXdW6CoSYXAHg7aiPZiABoTjxqD5HZv4c8jo/jDMcoeiOdqR1HQ/IaePGFkJs/+hrcNaAAHymjcidAj8lAPhaCNBeguP/O/cwMjPgxy9qMqB60FWvYSPIBmPxpi6B1eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=wLqfk9r0; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="wLqfk9r0"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e2eba31d3aso177047a91.2
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Nov 2024 20:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731559577; x=1732164377; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ciPpdd8xZxgVXtxncNlZsl62adjxx/9Ixp3cayb9PO8=;
        b=wLqfk9r0tm7SFbvymnltWzWTal0+WF4Bg/utprWxK6XNVJ6dM+2Bq9bBht8OI+TfYm
         vK8jP8bHfl6MMKG8q6I1RA7l/zaw6qkNQ6ps1ZYbG6EaWAH+TLoRShcGp8MRaMKaPr2y
         zaVffYI9m4eJUH1h8hzjNtgZatyVGxFuHFerPbM/QO8rB973lMvEC0+GaewPw0vG1hWN
         bs8RwTSOJZ8KwmdECILTjimH827R42BL3chuuXIL/jT7cy1T6SfEkmxVmMa5TXETQgPL
         T+vYeEBZftrNizrQFQ/rLDn8gIDPy+6yq+Y4vvp2TknmCPr0oWHxEaXT0vAlreOeRDL4
         jcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731559577; x=1732164377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciPpdd8xZxgVXtxncNlZsl62adjxx/9Ixp3cayb9PO8=;
        b=VBP/EB/03xvJPOxKG5bvP/Zfs8PHCMkSNH8h5bjAUY1ItKmN8OqMQVQWZeczd81JOK
         TCwplrb/GWufDWiq9+BJ0/d21qQJIk+Gv8H20HVPLKlyy3yjFKXVfBBfAgGQ4Z/2CHsm
         mSUewufHJW6sNxAIe+XK2QQVLQg6psCMdHTSSee9jor14PymkZJZXWkpwtW2K4dSqF5j
         EnXe1gxixYHdAfdUxXzQGKPmz3YTmcxvtiqpPmYifItQnYC0ROwbt82dudcd4lOr9gvp
         +cMhGhK7tPMyu2BtB5gAZ1arHPcDX8zQ7T/CQ+DCFI3jsCdKcmz/68EjLHmFrZ6R6MYk
         tkoA==
X-Forwarded-Encrypted: i=1; AJvYcCXUUbaSo5lE9iw9vSpUsModp1W3UDufgN6ex4g5+/AepALeZi7EEOM7alOncYf2rA7pNartWsa5x92bqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyN33TlIQQVNYm/IMdXYW7fXYBmq7pyjn2e7V0GYydvT3Jg103d
	Ekg3Bw2knlmEXGZE2OwL/5Cn5izzF79vNWf4Jjj1BqNRxdS8kSdVPIAdSNGFeZA=
X-Google-Smtp-Source: AGHT+IHwmfiSpNRYwoKTDlPVlAYVWz1iKVKE6iuP2huEnhh9oY77ssSAXAPaqGmYjbMQgR+sM8uIAQ==
X-Received: by 2002:a17:90b:37cf:b0:2e5:8392:afe7 with SMTP id 98e67ed59e1d1-2e9b14dc341mr30805661a91.0.1731559576254;
        Wed, 13 Nov 2024 20:46:16 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea06f1b17asm264488a91.15.2024.11.13.20.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 20:46:15 -0800 (PST)
Date: Wed, 13 Nov 2024 20:46:12 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andybnac@gmail.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 10/14] riscv: hwprobe: Add thead vendor extension
 probing
Message-ID: <ZzWAlJm1ShgsZr4m@ghost>
References: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
 <20241113-xtheadvector-v11-10-236c22791ef9@rivosinc.com>
 <tencent_5B500856E30E1FB920B6B68D6315EE70CC06@qq.com>
 <ZzVoQi6D0U30p9sg@ghost>
 <tencent_6A95637042401AD5F8BE05C7B4F11CAD7009@qq.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_6A95637042401AD5F8BE05C7B4F11CAD7009@qq.com>

On Thu, Nov 14, 2024 at 11:26:47AM +0800, Yangyu Chen wrote:
> 
> 
> On 11/14/24 11:02, Charlie Jenkins wrote:
> > On Thu, Nov 14, 2024 at 10:44:37AM +0800, Yangyu Chen wrote:
> > > 
> > > 
> > > On 11/14/24 10:21, Charlie Jenkins wrote:
> > > > Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0" which
> > > > allows userspace to probe for the new RISCV_ISA_VENDOR_EXT_XTHEADVECTOR
> > > > vendor extension.
> > > > 
> > > 
> > > Hi Charlie,
> > > 
> > > How about changing the name of the key from
> > > "RISCV_ISA_VENDOR_EXT_XTHEADVECTOR" to "RISCV_HWPROBE_KEY_VENDOR_EXT_0" and
> > > use marchid to identify what the vendor is, each vendor will have its own
> > > bit definition in this value. So we can avoid adding so many hwprobe keys
> > > for each vendor in the future.
> > > 
> > > I proposed a commit here: https://github.com/cyyself/linux/commit/36390645d85d1ac75dd71172f167719df4297f59
> > 
> > I actually originally had this in one of my first versions of this
> > series but was convinced by Conor to change it. The problem with it was
> > that tying vendor extensions to mvendorid means that it is enforced by
> > the kernel that vendors cannot share vendor extensions. It is possible
> > for vendor A to purchase IP that contains a vendor extension from vendor
> > B. This vendor extension should work on platforms created by vendor A
> > and vendor B. However, vendor A and vendor B have different mvendorids,
> > so the kernel can't support this if it is tied to mvendorid.  It could
> > be solved by duplicating every extension that vendors have, but then
> > userspace software would have to keep in mind the mvendorid they are
> > running on and check the different extensions for the different vendors
> > even though the implementation of the extension is the same.
> > 
> > The original conversation where Conor and I agreed that it was better to
> > have vendor extensions not rely on mvendorid:
> > 
> > https://lore.kernel.org/linux-riscv/20240416-husband-flavored-96c1dad58b6e@wendy/
> > 
> 
> Thanks for your explanation. I will strongly agree with Conor's opinion if
> the feature bitmask does not exist in RISC-V C-ABI.
> 
> However, as the feature mask defined in RISC-V C-ABI[1] uses the design
> depending on marchid currently, should we reconsider this key for its use
> case? The current target_clones and taget_version implemented in GCC[2] and
> LLVM[3] also use the bitmask defined in C-ABI. I think if we use this key
> depending on marchid, to make a key shared with all vendors will make this
> cleaner.

Changing this will break linux userspace API. It is a non-workable
solution for the kernel to associate extensions with marchid/mvendorid
for the reasons provided. I fail to see why this ABI would require the
kernel to behave in this manner. The ABI provides the marchid to be used
by function multi-versioning and applications are free to use the
marchid to change which function they want to compile. However, if they
want to know if an extension is supported, then they need to use
hwprobe. If they want to check if xtheadvector is supported, then they
call hwprobe with the xtheadvector key. This is true no matter what the
mvendorid of the system is. This does not add any complexity, "clean"
code can equally be written following this scheme or following a scheme
that relies on mvendorid. Ditching the reliance on mvendorid in the
kernel allows the kernel to be as generic as possible, and allow
whatever ABIs or hardware that exist to have a resiliant way of
communicating with the kernel.

- CHarlie

> 
> [1] https://github.com/riscv-non-isa/riscv-c-api-doc/blob/main/src/c-api.adoc#function-multi-version
> [2] https://github.com/gcc-mirror/gcc/blob/8564d0948c72df0a66d7eb47e15c6ab43e9b25ce/gcc/config/riscv/riscv.cc#L13016
> [3] https://github.com/llvm/llvm-project/blob/f407dff50cdcbcfee9dd92397d3792627c3ac708/clang/lib/CodeGen/CGBuiltin.cpp#L14627
> 
> > > 
> > > > This new key will allow userspace code to probe for which thead vendor
> > > > extensions are supported. This API is modeled to be consistent with
> > > > RISCV_HWPROBE_KEY_IMA_EXT_0. The bitmask returned will have each bit
> > > > corresponding to a supported thead vendor extension of the cpumask set.
> > > > Just like RISCV_HWPROBE_KEY_IMA_EXT_0, this allows a userspace program
> > > > to determine all of the supported thead vendor extensions in one call.
> > > > 
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > Reviewed-by: Evan Green <evan@rivosinc.com>
> > > > ---
> > > >    arch/riscv/include/asm/hwprobe.h                   |  3 +-
> > > >    .../include/asm/vendor_extensions/thead_hwprobe.h  | 19 +++++++++++
> > > >    .../include/asm/vendor_extensions/vendor_hwprobe.h | 37 ++++++++++++++++++++++
> > > >    arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
> > > >    arch/riscv/include/uapi/asm/vendor/thead.h         |  3 ++
> > > >    arch/riscv/kernel/sys_hwprobe.c                    |  5 +++
> > > >    arch/riscv/kernel/vendor_extensions/Makefile       |  1 +
> > > >    .../riscv/kernel/vendor_extensions/thead_hwprobe.c | 19 +++++++++++
> > > >    8 files changed, 88 insertions(+), 2 deletions(-)
> > > > 
> > > 
> 
> 
