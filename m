Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794194836;
	b=UAylaNt3ZWL6O27aUV4Eu2uD7IKcxUyIUTPpY4HsJVjM3Qxu+FJlhNKk6EgSjaoPxUrH
	 /KyC2jA1CAnOp6oO1+KYhyqNHg7lqyQpH79OBnlXPlaTTleZpXZGitsa3Wpymqv6/e+5a
	 9pBD3o8X8sFNkg+HNbYBf+bwlRwjU4RcBSEQ5FabmOfq555QWL6CvCOsQ8HIPsRAtKzZS
	 zxZbAkyV8Oyt2Vku5iK+nAKJ410cjjPV5p2JH9rYw7SVFsrxGPyTwnDQY4enmqjgO35mm
	 X5IQN0D7ERdNkk74QAsf0xgtDlmYYPJZBumbOXn9fiaEdIX816ZovUyN/hUYBskU9fA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794194836;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ZohoMailClient;
	bh=TpD4Qm/8zgFf7AXrcg7HkBUl+/qWD0ZfHjTxcOeCSqY=;
	b=uUCtO6ofMrzpQKtVZkR2LEknTgUhwDj8mWvzvsXIRJaNUGdNH4jxnQDqlu800I4eGhNA
	 L3zYLKKYB0CepgwE2BKjI6rVCtISaIUEfLWP71vjOnCFCv46Y+7x/ez87l4ulHkEmB3/O
	 Z+cbFx7/QmfVCTTnI7kDqi/PRagiSFInAoqGPUTtVhk/mDn0HJDE4oNVv0WGUQVXcUGO8
	 Sez6qH5l+vpM9xqdzts31oXnkIVxsy5SLoJrXDUhdcGaYTRXuu7bw9jDfzVqSnJ59Wxiq
	 EN09YRfzg3UJ7lAMfuZxracCgxlyXZcIdgnAUXoGhOy6aRR/E1N3zF41jwFTFjGo00w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pigmoral.tech;
	spf=pass smtp.mailfrom=pigmoral.tech;
	dkim=pass header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=NxiCE+6y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.12
Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AEE606A31C
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 03:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97AEE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=NxiCE+6y
ARC-Seal: i=1; a=rsa-sha256; t=1794194827; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FUu2k3l16OUWOAD4erVCXqWmWp0ZbO7uL6E9N9cxh/0G+nIHi37Smp7jFkEgO15xvi3MfBlYj/Wt28RwGlKW9uhcZ4dEe3d3OsAl5aI9PSHFs2GOcfm2Sly81rvNwTnmmi01HV9mEgwHOAhj91VjrOZXzH2ARsGkeJtVW99rUhs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794194827; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TpD4Qm/8zgFf7AXrcg7HkBUl+/qWD0ZfHjTxcOeCSqY=; 
	b=lcvaIHG27YaH56p5ryrNyrFFIHCDvrAj1SEEnD0cFR84fu6WBRPI670Hlhex6904kTUn9w/TEVXrCkQmAJjiN4P5yOd48dxwZmsgx+gxSVwLG7UYkydb/jlIq8ZFf9OIFCXXchgXeczFm6TZYmDeh8t+hPZKLtM5RCzhCt8iuTQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: a=rsa-sha256; b=NxiCE+6yfbr4oEFyZobyLdCcJ1q0wNqxmj65j3ziHU2e3kwtsEVwGnOUzKoTSks6zPfYmfWBbY5yOMbX/AEK9nxCE22ZY14yWRGOaQZWGBzFNvWk4N6JH4O+a07bHyp8P8NW1sSNJN20LDQ4+9apCfeq5CdjxCvzsadx7bE2mPw=; c=relaxed/relaxed; s=zmail; d=pigmoral.tech; v=1; bh=TpD4Qm/8zgFf7AXrcg7HkBUl+/qWD0ZfHjTxcOeCSqY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794194826003917.809001112961;
	Sun, 8 Nov 2026 19:27:06 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 11:27:00 +0800
Message-Id: <DMQCZDVK4SR9.1TARE71NCL8T8@pigmoral.tech>
Cc: "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>,
 "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney+clk@redhat.com>,
 "Jerome Brunet" <jbrunet+clk@baylibre.com>, "Andre Przywara"
 <andre.przywara@arm.com>, "Enzo Adriano" <enzo.adriano.code@gmail.com>,
 <linux-clk@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 6/8] clk: sunxi-ng: a733: Add mod clocks support
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Vinicius Pedrosa" <vinicius.eduardo.pedrosa@gmail.com>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.22.0
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech>
 <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
 <20261028180913.2829389-1-vinicius.eduardo.pedrosa@gmail.com>
In-Reply-To: <20261028180913.2829389-1-vinicius.eduardo.pedrosa@gmail.com>
X-ZohoMailClient: External

Hi Vinicius,

Thanks for reviewing and testing this.

On Thu Oct 29, 2026 at 2:09 AM CST, Vinicius Pedrosa wrote:
> Hi Junhui,
>
> In patch 6/8, usb2-u2-ref is declared as a plain mux, but the manual
> has a gate at bit 31 of 0x1348, and its reset value is 0. So the CCU
> driver can't enable it.
>
> -static SUNXI_CCU_MUX_DATA(usb2_u2_ref_clk, "usb2-u2-ref", usb01_ref_pare=
nts, 0x1348, 24, 3, 0);
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(usb2_u2_ref_clk, "usb2-u2-ref", usb0=
1_ref_parents,
> +                                    0x1348, 24, 3, BIT(31), 0);

I'll add the missing gates to both usb01_ref_clk and usb2_u2_ref_clk
in the next version.

>
> I hit this on my Cubie A7Z with a USB stick on the DWC3 port (the DT
> and the USB2 PHY driver for that port are local, not posted):
>
> - v6 as posted: 0x02003348 stays 0 and the DWC3 soft reset times out
>   (-110), 4/4 boots, one of them cold.
> - same kernel, only bit 31 set from U-Boot: the host works, 3/3.
> - with the change above: works, 3/3.
>
> Same DTB and initramfs in every run. The SerDes gates were also the
> same, so I haven't checked whether they matter on their own.
>
> My boot chain (U-Boot SPL, TF-A, U-Boot) leaves bit 31 clear. I don't
> know what the vendor one does.
>
> Thanks,
> Vinicius

--=20
Best regards,
Junhui Liu
