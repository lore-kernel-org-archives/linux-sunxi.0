Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794735452;
	b=vDt7IyGhPqX8TPB9MnT3J0NzbEwUjTbrTntyAGhTkzsLwqDVN8EmuQaDOVJStxuhHfSu
	 4gPvaODyzDCs2MKVFDhVj7UfRef6gy0mvmKMCW9p5tjldZ+4FRxyE17wJdBJbM+AGhj7X
	 UfFRKAzTmTDCoWFnQ56KAZBIgm3sKucse6ttT7dRGCZ72yn+yo/+p3RO65DWD2WUFChJs
	 Seh52jlHPoSTdTfiWr0UguGmACmdN0xC7ZDVof8aQ7hnn0Q1KEP+oXvJuZY+VycSNGgsw
	 8D96vx+w/pLrXV9hptZfWiwV7CBWW4XhGMROKyuDqabUuQrFClk+hQOv6xtVh1AUvyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=9YdGDxh7Ze+8JBYVAz+nHFyu+3sFQKOsF12R5ua0EZw=;
	b=WhEbUUViBbnjDTTauCn7ngPaJLLFdsrDhSvDSTKuq2h61bOoEktWtG2oQWtBSJLaUnwp
	 7PRGq6WAMCFORyhngtCqNa9hwewqFNVngtXdtYaOweU9MDa5nqU9H7Q1Fx30ED+GzFzgB
	 Fd0aHar2X4e14fx5PLa201VN05PEjQnBSRpy1H8O2zuKO3HBch1QF0Wke8PrlA5IVDK+s
	 yp6g7bRMC0TwrFWwH3h++i3f778gw3fhb5R3cWSnbNTRe+nBDjhacn8JgDrwsBdSK7PnG
	 e6hASOqnlFAru21zjmF9k32BzyZpVf5mfdDfJXfv6JaIle0t1RtPgsAek0eCFiA5/RQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y4FvzawB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76677606A31A
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76677606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y4FvzawB
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab30d04674so3253881fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 01:37:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794735451; cv=none;
        d=google.com; s=arc-20260327;
        b=siBbfMFtvUFOtMUOXFceTveVrjo+bjuaF0NEJGTiHcDi8ZSUm5sLNL0/WsoBi2zEdC
         56XXTiQHpOszKczndaVZWsGypD5t1zz+0P3QIs+QABfTK8kumqp/aI/9vS/AvA588As4
         qeKqdAZd5IgXTeb5SKW/Os0J++BZcO4ZrIqx4neqmkPK3rOJ1L1TArihfH4T1trPD34L
         zDVOVd2pQZR6IC9VHrYePx62S91G5ksNKHQ8ORP1dqRLCE/R+EmtHliekTPtnt2veHuK
         FP+IOawA6W0vTchuC4CZLeGVCZXNi0uwFLwlU6yomhgIuTR/9VmBfGQfLZmTFQWNuMEV
         P8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9YdGDxh7Ze+8JBYVAz+nHFyu+3sFQKOsF12R5ua0EZw=;
        fh=DHjdiazyXdowSKc8QFJ0cQPiw6JytCzKGsbsz5/ouWo=;
        b=L3dFhvKWRAYZjTOssb4BLrjUyF5vFtZQgAA9MZAxuEXSpbAbQUZRUo5Slz8vwq+O5/
         N+8YF8NYVhRYjVHteiDexi7uO39IuKoSzw7hvemkXRfqQGEazgI+vqaqjyBjndElQdwH
         qlQRM6CU2oxfWOyoJz1qVmiBMpazjoflRIWVnSJ3Svf0khnWC6lXmLxpbqtvO32JOD5m
         uvZTjsljExJ6/1ICV95MtmV4gfvizOxpMiJTJdutPqXR342ff9IuaduX17/s3+RiTuHk
         V5h8eDK26AJtWs6jpSXz7ELbZ1eAk+UpDX9sF2j4v419PocOXm2CIusbZnJmolIxFclH
         Ek7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735451; x=1795340251; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9YdGDxh7Ze+8JBYVAz+nHFyu+3sFQKOsF12R5ua0EZw=;
        b=y4FvzawBHqVD3kIuIgzSSt9T2zQ7ERPS1dyyN/xTJMrPU5NGUReCy2nEtcrtYvql2Q
         r3ASsLpPaefl796e4N+WjFMEXZVph7TeMaL9W0m/mmTT/oPJuDXp9qf1xKcJ5EpoFj+O
         zDcwpko7oWz28vECdrf8rt6snhmj1S+fSGfBExWsM47UsdQP0GoPSjvJX/v+efMO7gmq
         TvCfDf7DJzHyDBbhxx9PagUHKBlKVC4ZUzE1GItI3C1YiMMTLaMboRHwMy3ti6NPlmMo
         cEtL/60i1PNX1RnZUd4IJTdHGS6UDcGcxTCik1jOW70U6yOmHE+cD83fsvqg3ipuTIYf
         83Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735451; x=1795340251;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9YdGDxh7Ze+8JBYVAz+nHFyu+3sFQKOsF12R5ua0EZw=;
        b=KqrhHiMyb5mtePxG97ekzxTlLBHqnJW4bplJuRdFxyrP0WrU+m1mxuxE5SH3d4Ku/y
         jVJ5UeWluvWNnzmHN7zqWReBXVQh5e3hB/lbWyIpOP7qojnAQuNLKJx8+KO9SLhkFjW4
         TB2YrN/l7YK6BP6/RQWRHPT9de6c/EQWOqElPRJquKId5Ah6RjGZr6SpIqASNudIyp5+
         yV2DqNASrRuUQhufrUxkBWk498nmFEQ4VrNCQPJOg/Q6kYpX98yFdAMnL+GsBf6rB9Cx
         71bACYGlGdclU4eVglAw30fLxKjvWeBdjA68rrY771ukImE+gv2W+INyyHeWVug7f2sH
         wYyw==
X-Gm-Message-State: APuU4Z/3nN2VIBLWkNNNt3qw38XsZ+K3LVz7h21fc7GiOg2QMcKEo246
	mpXFL5Kg0M6W+b/apUhjQWxE5lJgx/bgrYCeHdqOyyLVigjT1j86YoabH6Cwis6599GKUCb0hFT
	P1EugiFwBh3YFpFDDshj4xlY/ulQVs10=
X-Gm-Gg: AYBFou1ieNTlO/8cXkd7z5a3Fy1UOlgYxfZWl/fuHgq7vcb8e23bfoOIfi4vDvs1Sgy
	Kn1Mbu69frmGICCKLV12RNvPDSz+7/o+VSp/uDoMWfjsgi5jf552oDXAz/FPffvIa8l1nuIRkLO
	u+gskN2XIxM49n44FULHz1MXH2dzH760bwcnasaG3lpjW4B9+zUyWaXorzBwiKkeVsosoltO0Xt
	9KBqc9qidQ60omHQlGgpJIGFzGnG05pzofkux0VOwgRCaFwRFRluAAX0RabFr/HEytlVzu9ZQWs
	dyA794Mi5j9tEpf5EsXkIDalv52WAnI2BruLFR6WqOjnYj9kcAild+R2HFNfy/DjHTM5AR2GzTD
	C7gGYDyMIUmHRdKrSPg5u1ou5kb+2Ons0W3RFUkK6J1etiMd+ZAsPwbN52hi3y9h1I2DPnaU=
X-Received: by 2002:a05:6512:3da4:b0:5bf:ce1f:cd22 with SMTP id
 2adb3069b0e04-5c170434e66mr3022509e87.0.1794735450387; Sun, 15 Nov 2026
 01:37:30 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112-sun8i-emac-jumbo-v2-0-aca0cf23cf17@gmail.com>
 <20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com> <sashiko-outbox-212453@kernel.org>
In-Reply-To: <sashiko-outbox-212453@kernel.org>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 15 Nov 2026 01:37:19 -0800
X-Gm-Features: AclHuK-dBs5tcGLiNTXMlpJ6fJ506k-GawskVNNq_c9vi7eI7zz1TvcPiOwmtXI
Message-ID: <CAEy9hNW97JqTBtjtYGt8_gJetjUokirr8U8oWenKByDjenefvQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-sun8i: Enable jumbo
 frames up to MTU 2018
To: sashiko-reviews@lists.linux.dev
Cc: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> So what you are doing is just papering over what is broken underneath.
> Fix the actual problem so we can have MTU up to 9 KB.

Agreed. I'm fixing the multi-descriptor jumbo paths in stmmac itself,
aiming at the 16 KB the hardware allows. It's nearing completion; v3
follows once it passes on hardware, with 1/2 included.
