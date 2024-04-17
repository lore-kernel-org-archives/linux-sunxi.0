Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BC480C14
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 22:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713391385; cv=none; b=IC9qMNoWEfcN17NECKhUPPc+uieEDhOZHU24PWC172pOdM4ktpbpJBawYnCvg6Kj2PydVEeifVonezPceEKEb/sFRhXH+samCuOplbIG4Vb5/KFbxZSRrIH1j8IObc0RaG3FaRi3fj1aUsw4CnNOWX8oJeyyyWiPe+wG1rk3i9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713391385; c=relaxed/simple;
	bh=/mxEbzrtfKRBRW2ylMaJOJIL08rEXnGmad4GMUQvqxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sr5WbPyNmAuJi3VVcMbeY/zQGBY3FPoYzjM4kwQ/4FHAFmlFFPYP8UxANDcdby5wWbgrM03tCBZvX2w7iNCXvXxKhCclI+dj73AB41XhX4wGzmiPl6nSz4a5co5RlsNlwlUMdkEhl6QeqejJwQK/feFck5FshildxriPXyWuFnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=CBD5h6Dx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CBD5h6Dx"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e3ff14f249so1801435ad.1
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 15:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713391383; x=1713996183; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TOg+4peSbuh+u6umA30FkzFrxjlU1+w9W1USZJ6mxxM=;
        b=CBD5h6DxeX1CgzPizMP/kbYA6zSFDmewwlNbs7w8JFFEf+ta8UcrUJabp6OsXwskxL
         xDx8bd25hhtbe+VOF2SIwdwY9bR6eIdcqcBPKq+pJeUBtqenAHENjHMtloXGqmEbFMdU
         dJqa19V0y6GCGhGRRQu3Ppl/a5aXsVdOTNkuFbkuubzGBFik01luaGrhMaeZDvI19uWb
         mU7ewHwS927CTsOuNTK1ypqi4oYeju/5eWU+t5Rb3J0Y/L4ddBytsNdTizefu0lH1Fp4
         vo8/zKxLsEh2TuLGGZMlJqV1fXVYYvBmS1Lk7Myo17GOHOSksYzcBIL+z5utypRuLb4T
         dM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713391383; x=1713996183;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TOg+4peSbuh+u6umA30FkzFrxjlU1+w9W1USZJ6mxxM=;
        b=PVtXza/TuLH0VxaUhRY8ccgxC9xWRnARpbgZtwkn5fQEE1NjFhelVyqJ5yWbXCARxe
         dX8HGR65cxISEHi9r23SNnUBnuu+fQFnKNX6AkVYiYnl2FUgVqFV3SjzBcM1pSbNbf6A
         KDKLBvbbUddlwCzR2v9+LBSNExUZk+IW3l1u+PgaZMmRdaBuXMir3mYxz/BJ0QX+DLua
         IpduOTSk+Jwf5JE8N5RXmb09NTAOMDdYJ4i082v9UgWNk0juhhO/hX9H/ETzimjFX37V
         0EqtQ0efjDd+mMn5cQyBXC+trKpG/6sVaIfs8eRdMxYkqIKiVy+1UJJcCzVnpUUHfk3B
         QSPg==
X-Forwarded-Encrypted: i=1; AJvYcCXkR9Z/XgsiM4cT46xQbXGneAWGLsYTaJnJ1VJCCil4alLnGWKok5v4WbnMzR63fB9XYn19h87RzPLdxKXHYEEiDJxbN0eHkt5t8pk=
X-Gm-Message-State: AOJu0Yx5hvRyERPje3sYrtBButvIbrfhLIM8fWP5KtZhuX2V6Uh0FdSk
	0pFigfjvLFWxCAFpafqM7PNk3/LqXPLkaR0emSkknlKVLabrMik0Z+5hm2ruZOY=
X-Google-Smtp-Source: AGHT+IFr8zNA3J9HdtEMqCof6TcRAeDh1gitRiXfspUsnuCo2SEQrCrbPu92YduZoeuLtzyibErqkQ==
X-Received: by 2002:a17:902:db02:b0:1e8:5923:2f60 with SMTP id m2-20020a170902db0200b001e859232f60mr492056plx.18.1713391383352;
        Wed, 17 Apr 2024 15:03:03 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id w17-20020a1709027b9100b001e3e222072esm126821pll.53.2024.04.17.15.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 15:03:02 -0700 (PDT)
Date: Wed, 17 Apr 2024 15:02:59 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <ZiBHEyVJKkIZon+p@ghost>
References: <ZhlrdGXfSushUNTp@ghost>
 <20240412-eastcoast-disparity-9c9e7d178df5@spud>
 <ZhmeLoPS+tsfqv1T@ghost>
 <20240412-chemist-haunt-0a30a8f280ca@spud>
 <ZhmoPuoR00aS6qZp@ghost>
 <20240413-sharper-unlivable-5a65660b19e2@spud>
 <Zh3xrTfjjk3b4GHb@ghost>
 <20240416-husband-flavored-96c1dad58b6e@wendy>
 <Zh9PLhUZmCF5mLXc@ghost>
 <CALs-HssYAHrBy-uYKNT_zS02F_65qJZh80OD-W1RrmmYosFU=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALs-HssYAHrBy-uYKNT_zS02F_65qJZh80OD-W1RrmmYosFU=Q@mail.gmail.com>

On Wed, Apr 17, 2024 at 09:02:05AM -0700, Evan Green wrote:
> On Tue, Apr 16, 2024 at 9:25 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > On Tue, Apr 16, 2024 at 08:36:33AM +0100, Conor Dooley wrote:
> > > On Mon, Apr 15, 2024 at 08:34:05PM -0700, Charlie Jenkins wrote:
> > > > On Sat, Apr 13, 2024 at 12:40:26AM +0100, Conor Dooley wrote:
> > > > > On Fri, Apr 12, 2024 at 02:31:42PM -0700, Charlie Jenkins wrote:
> > > > > > On Fri, Apr 12, 2024 at 10:27:47PM +0100, Conor Dooley wrote:
> > > > > > > On Fri, Apr 12, 2024 at 01:48:46PM -0700, Charlie Jenkins wrote:
> > > > > > > > On Fri, Apr 12, 2024 at 07:47:48PM +0100, Conor Dooley wrote:
> > > > > > > > > On Fri, Apr 12, 2024 at 10:12:20AM -0700, Charlie Jenkins wrote:
> > > > >
> > > > > > > > > > This is already falling back on the boot CPU, but that is not a solution
> > > > > > > > > > that scales. Even though all systems currently have homogenous
> > > > > > > > > > marchid/mvendorid I am hesitant to assert that all systems are
> > > > > > > > > > homogenous without providing an option to override this.
> > > > > > > > >
> > > > > > > > > There are already is an option. Use the non-deprecated property in your
> > > > > > > > > new system for describing what extesions you support. We don't need to
> > > > > > > > > add any more properties (for now at least).
> > > > > > > >
> > > > > > > > The issue is that it is not possible to know which vendor extensions are
> > > > > > > > associated with a vendor. That requires a global namespace where each
> > > > > > > > extension can be looked up in a table. I have opted to have a
> > > > > > > > vendor-specific namespace so that vendors don't have to worry about
> > > > > > > > stepping on other vendor's toes (or the other way around). In order to
> > > > > > > > support that, the vendorid of the hart needs to be known prior.
> > > > > > >
> > > > > > > Nah, I think you're mixing up something like hwprobe and having
> > > > > > > namespaces there with needing namespacing on the devicetree probing side
> > > > > > > too. You don't need any vendor namespacing, it's perfectly fine (IMO)
> > > > > > > for a vendor to implement someone else's extension and I think we should
> > > > > > > allow probing any vendors extension on any CPU.
> > > > > >
> > > > > > I am not mixing it up. Sure a vendor can implement somebody else's
> > > > > > extension, they just need to add it to their namespace too.
> > > > >
> > > > > I didn't mean that you were mixing up how your implementation worked, my
> > > > > point was that you're mixing up the hwprobe stuff which may need
> > > > > namespacing for $a{b,p}i_reason and probing from DT which does not.
> > > > > I don't think that the kernel should need to be changed at all if
> > > > > someone shows up and implements another vendor's extension - we already
> > > > > have far too many kernel changes required to display support for
> > > > > extensions and I don't welcome potential for more.
> > > >
> > > > Yes I understand where you are coming from. We do not want it to require
> > > > very many changes to add an extension. With this framework, there are
> > > > the same number of changes to add a vendor extension as there is to add
> > > > a standard extension.
> > >
> > > No, it is actually subtly different. Even if the kernel already supports
> > > the extension, it needs to be patched for each vendor
> > >
> > > > There is the upfront cost of creating the struct
> > > > for the first vendor extension from a vendor, but after that the
> > > > extension only needs to be added to the associated vendor's file (I am
> > > > extracting this out to a vendor file in the next version). This is also
> > > > a very easy task since the fields from a different vendor can be copied
> > > > and adapted.
> > > >
> > > > > Another thing I just thought of was systems where the SoC vendor
> > > > > implements some extension that gets communicated in the ISA string but
> > > > > is not the vendor in mvendorid in their various CPUs. I wouldn't want to
> > > > > see several different entries in structs (or several different hwprobe
> > > > > keys, but that's another story) for this situation because you're only
> > > > > allowing probing what's in the struct matching the vendorid.
> > > >
> > > > Since the isa string is a per-hart field, the vendor associated with the
> > > > hart will be used.
> > >
> > > I don't know if you just didn't really read what I said or didn't
> > > understand it, but this response doesn't address my comment.
> >
> > I read what you said! This question seemed to me as another variant of
> > "what happens when one vendor implements an extension from a different
> > vendor", and since we already discussed that I was trying to figure out
> > what you were actually asking.
> >
> > > Consider SoC vendor S buys CPUs from vendors A & B and asks both of them
> > > to implement Xsjam. The CPUs are have the vendorid of either A or B,
> > > depending on who made it. This scenario should not result in two
> > > different hwprobe keys nor two different in-kernel riscv_has_vendor_ext()
> > > checks to see if the extension is supported. *If* the extension is vendor
> > > namespaced, it should be to the SoC vendor whose extension it is, not
> > > the individual CPU vendors that implemented it.
> > >
> > > Additionally, consider that CPUs from both vendors are in the same SoC
> > > and all CPUs support Xsjam. Linux only supports homogeneous extensions
> > > so we should be able to detect that all CPUs support the extension and
> > > use it in a driver etc, but that's either not going to work (or be
> > > difficult to orchestrate) with different mappings per CPU vendor. I saw
> > > your v2 cover letter, in which you said:
> > >   Only patch vendor extension if all harts are associated with the same
> > >   vendor. This is the best chance the kernel has for working properly if
> > >   there are multiple vendors.
> > > I don't think that level of paranoia is required: if firmware tells us
> > > that an extension is supported, then we can trust that those extensions
> > > have been implemented correctly. If the fear of implementation bugs is
> > > what is driving the namespacing that you've gone for, I don't think that
> > > it is required and we can simplify things, with the per-vendor structs
> > > being the vendor of the extension (so SoC vendor S in my example), not
> > > A and B who are the vendors of the CPU IP.
> > >
> > > Thanks,
> > > Conor.
> > >
> >
> > Thank you for expanding upon this idea further. This solution of
> > indexing the extensions based on the vendor who proposed them does make
> > a lot of sense. There are some key differences here of note. When
> > vendors are able to mix vendor extensions, defining a bitmask that
> > contains all of the vendor extensions gets a bit messier. I see two
> > possible solutions.
> >
> > 1. Vendor keys cannot overlap between vendors. A set bit in the bitmask
> > is associated with exactly one extension.
> >
> > 2. Vendor keys can overlap between vendors. There is a vendor bitmask
> > per vendor. When setting/checking a vendor extension, first index into
> > the vendor extension bitmask with the vendor associated with the
> > extension and then with the key of the vendor extension.
> >
> > A third option would be to use the standard extension framework. This
> > causes the standard extension list to become populated with extensions
> > that most harts will never implement so I am opposed to that.
> >
> > This problem carries over into hwprobe since the schemes proposed by
> > Evan and I both rely on the mvendorid of harts associated with the
> > cpumask. To have this level of support in hwprobe for SoCs with a mix of
> > vendors but the same extensions I again see two options:
> >
> > 1. Vendor keys cannot overlap between vendors. A set bit in the bitmask
> > is associated with exactly one extension. This bitmask would be returned
> > by the vendor extension hwprobe key.
> >
> > 2. Vendor keys can overlap between vendors. There is an hwprobe key per
> > vendor. Automatic resolution of the vendor doesn't work because the
> > vendor-specific feature being requested (extensions in the case) may be
> > of a vendor that is different than the hart's vendor, in otherwords
> > there are two variables necessary: the vendor and a way to ask hwprobe
> > for a list of the vendor extensions. With hwprobe there is only the
> > "key" that can be used to encode these variables simultaneously. We
> > could have something like a HWPROBE_THEAD_EXT_0 key that would return
> > all thead vendor extensions supported by the harts corresponding to the
> > cpumask.
> 
> I was a big proponent of the vendor namespacing in hwprobe, as I liked
> the tidiness of it, and felt it could handle most cases (including
> mix-n-matching multiple mvendorids in a single SoC). However my
> balloon lost its air after chatting with Palmer, as there's one case
> it really can't handle: white labeling. This is where I buy a THead
> (for instance) CPU for my SoC, including all its vendor extensions,
> and do nothing but change the mvendorid to my own. If this is a thing,
> then the vendor extensions basically have to be a single global
> namespace in hwprobe (sigh).
> 
> I do like Charlie's idea of at least letting vendors allocate a key at
> a time, eg HWPROBE_THEAD_EXT_0, rather than racing to allocate a bit
> at a time in a key like HWPROBE_VENDOR_EXT_0. That gives it some
> semblance of organization, and still gives us a chance of a
> cleanup/deprecation path for vendors that stop producing chips.
> -Evan

Okay I will send a v3 following that method!

- Charlie

