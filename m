Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792949894;
	b=ExAnkASWvHyM8IycJBtaOyn9qthUNzWGtp5xSLpY2fbJb9rZA/jk4tyi1FUluvgxJYxX
	 imZwE8r7ZCv4EHFmlRVmlU7aQYgv6mbEi9t73iiG/9mF4uUgswFvca6ZuSaNwazPg++Yc
	 UmOQ8Xy4x7jjV1Na6m5b2zH9jGaS0Pg94KxuHO7+BuJU1t2uonmOjOF5Yj02xBeWdOgp3
	 UQoi4FJsg/nZNQPivR5ea0eRZSUGa+/rlOvkill0VepYzvyLHzw2khBTeHjeg8/zheR/l
	 3g26U2J//JRcpwnR1LTajZUkLtt/22mo2BcFnPzrkj86tCFlyyVZkewBVcbhjlgm4Tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792949894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HnZXVXFJcjscxnrsOc4diI+ORhtNKVuKMIKyqdM2PuM=;
	b=IyUCeUyVYEPU7gV4ux1fGjf69t8yeiFIOWMzelpL7BxLlxG73/MklEO5qXkyjG5W2Uex
	 ATvmAjndTrOP3OGQd/9ZCL4EhfyDq+l5mkZBtpb0px3c4dmmbcyZvS9fS+1IaJQtVrJ9g
	 q+AWgCPh6dXMCydlyUpypnzkF5UgDMoXiMGIU8RQSJw34M4t4xwijChyhqULvj0uVXMHZ
	 nbP66Xki14OTZR06IV+ee71z+LiJxYRxjVaUwKYSFLaP54t4yXgcP8Cq0kOWvZJa/G1G8
	 9IcFIkbxGxK91oA6UecKoZ5Rizfcg410NQ0SBS1SyLtwwKJ1g8Ir+ckbETlop5J5Lzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kIKHeyHx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90751606A31E
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 17:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90751606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kIKHeyHx
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-980c4258105so1333412241.2
        for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 10:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792949893; cv=none;
        d=google.com; s=arc-20260327;
        b=TT0S7pRWvxWqtkxW6WveFkiMqmE5YzMQc62ZLvQCiuv4kP/qOCSf7L6OrvNeVldMRT
         yz7rLGCKQ0zVzqqe/qf6ieWSzPwVPmYTElBrWgmkh3OsUNUMXJzn0GT4wlGWUWOwFtcy
         f3UjvRwVEcT2ky6NGrwgg7Ne4anZlfVqnmwaQpxdvn6ANGHzDNB56jFMHtoK8m18bYbX
         N8BKVIt1/SlzBzLl/vu40eN14p8F3kEyYO5EZLwE2T40zgLq3z6Shan9czM660tzpmKv
         IdmLCypTuGZNqu+6TsFD5DvjWbgpkey8xnB3iBv2gP4nXryy9epSVV3tsBh7h1E+NXQg
         P7Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HnZXVXFJcjscxnrsOc4diI+ORhtNKVuKMIKyqdM2PuM=;
        fh=J599M96mywGr7613CXYADbYWYylV85oIRzLcwc/kbTA=;
        b=WdkktBJp+X0lHUqIr+SNVDaD6gqa8GWvWkwX7fBabrJgYeLV5XC4dVLy0Yg5i6G9Jq
         qFiTLRBcKCWMwgCDOaak5mWYnVMFJ4nIl3/ipXyRQPgQvm9noY7wRabnORc62ADOEryZ
         jX5dKhOswHnmLF0/kenvQlM2A4q6nVDZfQOVrGq1leroetzJt6MdwNJ+ZaDfM1TMUZ78
         jT1i0RMuL+M4LaejaNqjE74n8IYi8dOLr55XDJPwBGNV8zgUmqYjbqycWr/jcn4v82t2
         3CXS7nTKE/baQXMFlVhslyXDNeC8AVfIneVU6/amSanW2g+4YnWJrxkMVzztH7l4uedF
         FzDQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792949893; x=1793554693; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HnZXVXFJcjscxnrsOc4diI+ORhtNKVuKMIKyqdM2PuM=;
        b=kIKHeyHxufvUY2f/kG7jhyddycmrBXV+6g5GcpxFrhhJpKTDGSJ3x2ZkA2NwNqLb2U
         IJ9/TuPqm6pQoNgcvkXWmowkG0q8sVTL+nPDfcSwR1Yyv6iiOp0TJgavBNvzncO+Fyqs
         truS1EGqnfTwb/sCYKX73X5dg0MQURQXuWq43iSBX4bzS2lnjjn16I9UkAwV79226hgg
         VHlhF9ExFS8rS+DmJnct4B1shODCUb7Klj/lV4GqFr0O01cEgzbE9kjKnSiTZCXK+0BA
         mSCiSVE0BUoMeMchjFoPGN8rRFrsw8zlU0+UKUPZC50O/MHDVJ8SanI9NOk2PPobceiF
         LHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792949893; x=1793554693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnZXVXFJcjscxnrsOc4diI+ORhtNKVuKMIKyqdM2PuM=;
        b=anzKPe1sdQzTe++1kHFtKqdbOe/FR0wFSjalkbp9yBmRf6a5Cwktgl+nfAFyJtG7HF
         3gfFn85bP81KR0/+V82z5ud5yNH9rL6ko1PgtJDOMmo0Xj0UxA4KZ4QSrsRQpQno67+C
         SYk5eLdboCYEc4nTNQFVTa17fjE+9xjV+62ieqI0NVwxKZJY8btMMKET2+5m2Q6boosb
         2fAoTR9D/NKIej3q7qqHSz0J/AY6qwizb3YIMu8B246sWD74LRzzWYnJCXQXYkjQp4Yi
         yXErMlw8SrqQKX6/a5z6wNLFM1O+jX/bifwz//HXyaGglwq9+PEsNYanoN9aIcfiXWgm
         M1sQ==
X-Forwarded-Encrypted: i=1; AKwUvByyNxIYMI1LGl8uwc/J0EH/rLS7iRTFPfUvI2J4EwGSLGel6MLoKw/f/Xo+ebijJyBuXkV81/bI0dtdkw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJFxNlyoxJYlo2Gu/JwWP/vh0ije+uUkmGHQsMbA96YLsrQOKv0
	x/Vgrmzmh1Zf2Sk+7Vr8lMfQHdmNXHleAQ/wmeY5HE2hLwBVFW8RKcifh0vQ1lcZXAIr6zypIvW
	H5C/3vHaulvrSy8QZjTdKRDRItfY5Kls=
X-Gm-Gg: AYBFou17rBpSopiq5HyQL3HEvJwTM771rRxaHXJo+aZY+Kjg/hpcpwUYf3tE1XxZOSx
	6A376Knlov+R8Biwrie/Vvc72W7KDiqmpfd+4UJBgedTjN1ISLjDl5wbgr2nlfY8mNBAOkWIJQ6
	7xy+thgsO+Rtog6voRrjLN8bDONKTLFL+vt+jQqITyUGXdIHjD/qsn/KZsW2f8XKkb8aSg3kWw3
	vkaSxee4KQGNscII1qWtE/ubmcpBYXxNjpOTFYBC0R6fUvAh1JqsqFc2OP899l4AvxUEQ3Tf9LZ
	2+8yDZq5HWCahyFk8tUVnhdh4AGqDmuHoLub9N1Edc2nocRzkBVrTwl3+oKfJr6VFp5okZV001W
	Ox0l12T+0N7MoRf7DBL/5uoxWGNHjUjTKPZLsGK04m2Lx/XjdOzRlg1DZnNHdQPDNrYQ+wvlXP4
	p3GWm9+heqwGeyO6MuNJAdf2zTuX7rvT0ifFJK/r5TIO7S7FSIP/8VVDyrS1DxpS2degwGMCxXI
	Kn5nahVIRfkKVEzdOAjv9gopqRWdqorMfSBiGthayqFkl8fifc=
X-Received: by 2002:a05:6102:c8f:b0:7c0:4d52:8cc9 with SMTP id
 ada2fe7eead31-7ce5cc8d55dmr1213666137.14.1792949893405; Sun, 25 Oct 2026
 10:38:13 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
 <atseYvQUYvpMFEIM@ashevche-desk.local> <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
 <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com>
 <atywVnHU5NsP_gOP@ashevche-desk.local> <CAGb2v64P2rM0VnFh0NfNhi+3_xGPYkxt2j+2hmBMu5ZvugHRow@mail.gmail.com>
 <aty37_xHO-QRa7hQ@ashevche-desk.local> <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
In-Reply-To: <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Oct 2026 11:38:00 -0600
X-Gm-Features: AclHuK9ADptacPxgJpmNc7NJsHyAAEhwuFjXIctIvJ_VhKssk-2-2xQxAyeIEHs
Message-ID: <CADvTj4p1vxCUsNk98Q=TRkvtZQ4LzXNY9V-2GT30aspRGUgrsw@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
To: wens@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 8:10=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Sat, Oct 24, 2026 at 10:51=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Sat, Oct 24, 2026 at 10:41:55PM +0900, Chen-Yu Tsai wrote:
> > > On Sat, Oct 24, 2026 at 10:19=E2=80=AFPM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Sat, Oct 24, 2026 at 10:10:33PM +0900, Chen-Yu Tsai wrote:
> > > > > On Sat, Oct 24, 2026 at 12:12=E2=80=AFAM James Hilliard
> > > > > <james.hilliard1@gmail.com> wrote:
> > > > > > On Fri, Oct 23, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrot=
e:
> >
> > ...
> >
> > > > > > > >       /* Internal 8250 only */
> > > > > > > >       UART_PORT_AIROHA                =3D 124,
> > > > > > > >       UART_PORT_AIROHA_HS             =3D 125,
> > > > > > > > +     UART_PORT_DW_APB_256    =3D 126,
> > > > > > >
> > > > > > > Why? Besides the poorly chosen name, what prevents us from mo=
difying the
> > > > > > > corresponding parameters at probe time by leaving the one of =
the existing
> > > > > > > types?
> > > > > >
> > > > > > The new type was primarily a way to reuse the core's FIFO confi=
guration
> > > > > > table, including the RX trigger mapping. H616 uses thresholds o=
f 1, 64,
> > > > > > 128 and 254 bytes, whereas PORT_16550A maps the same FCR bits t=
o 1, 4, 8
> > > > > > and 14 bytes. Overriding only fifosize and tx_loadsz would leav=
e
> > > > > > rx_trig_bytes reporting and selecting the wrong thresholds.
> > > > > >
> > > > > > The core already has get_rxtrig/set_rxtrig callbacks, though. I=
'll rework
> > > > > > this to retain PORT_16550A, supply the H616 FIFO parameters dur=
ing setup,
> > > > > > and use those callbacks for the correct trigger mapping.
> > > > >
> > > > > Please consider just taking the FIFO size from the DT. On some ch=
ips
> > > > > not every UART has the same size FIFO, so we already need to deal=
 with
> > > > > it.
> > > > >
> > > > > Also, FIFO size is a standard UART DT property, though somehow no=
t included
> > > > > for dw-uart.
> > > >
> > > > FWIW, it supports all standard properties for UART.
> > > > Check what uart_read_port_properties() does.
> > >
> > > Ah, that's nice. I hacked up something [1] in the past to get it to
> > > work, but that was probably before you added the helper. I never got
> > > around to splitting up the commits and sending it out.
> >
> > Hmm... The helper is in the kernel for the past 2.5 years.
> > Maybe you rebased it and it lost original dates?
>
> I had been carrying the changes locally without committing them. I only
> committed them recently to back them up remotely. So yeah, the dates are
> not accurate.
>
> > But if it's not working, we need to address that, I believe it should w=
ork out
> > of the box, because the same function is used across dozen of serial dr=
ivers.
>
> The new helper probably works fine. I can rework my code to use the value=
s
> given by the helpers and give it a try sometime next week.

I've incorporated that approach into v3[0]. The H616 DTS supplies
fifo-size =3D <256>, and the driver uses the value populated by
uart_read_port_properties() for the transmit load and receive-trigger
mapping.

[0] https://lore.kernel.org/all/20261024-submit-h616-uart-fifo-v1-v3-4-286f=
c1b8c3c1@gmail.com/T/

>
> > It might be an issue in 8250_dw.c, but I can't tell for sure.
> >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/co=
mmit/?id=3De7e0741fa04f349ad9f94a4059e32467a30ef5d9
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
