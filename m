Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BDC173
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Jun 2021 05:15:27 +0000 (UTC)
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.154])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id C95E4260EB
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Jun 2021 05:15:19 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id 45F8620013;
	Sat, 19 Jun 2021 05:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by filter2.mymailcheap.com (Postfix) with ESMTP id 1F5BC2A8AC;
	Sat, 19 Jun 2021 07:15:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
	s=default; t=1624079712;
	bh=oCbI6lqIU0vxpOAiLFj5Q78+8LjtPz2Q4/ksF5kyqac=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=pgzahy2EkN6W4vXeNzcnBXHF2vzVI76sYB3DRj3tgd4xBdHjU1jqa+QP3gXU9ME58
	 JY8hk8fCrhEBtBaJFuNEj6BbxN9oWJSh0VNtTJ6Pkh8nUiu+71/bcJcG0ygAxMGqM8
	 rL2h2fF81wmjm66H3/5WnwUmgAS6fUu6Ahn3M7xQ=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
	by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMyxG1KVa8Yw; Sat, 19 Jun 2021 07:15:10 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter2.mymailcheap.com (Postfix) with ESMTPS;
	Sat, 19 Jun 2021 07:15:10 +0200 (CEST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
	by mail20.mymailcheap.com (Postfix) with ESMTP id E0AEA40CBA;
	Sat, 19 Jun 2021 05:15:08 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
	dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="sFMM0xcJ";
	dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.162.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 63C4640CBA;
	Sat, 19 Jun 2021 05:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1624079704; bh=oCbI6lqIU0vxpOAiLFj5Q78+8LjtPz2Q4/ksF5kyqac=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=sFMM0xcJINA3kjcyk8/OExF41BID3zWBW1EZuvQlGU9BxMOyaOTGG0Um/VqxWP9w/
	 S/mJLrpQdRkhoBYTGPAqYo/9kNCXPsyoSYzgEwNunT09vw6dNYs6F0/upuLl/EJZLd
	 E0C6CVLMxLs0TbfLg0ZNKSmPZxKJ6osDIgSsRhaQ=
Message-ID: <1bb31644e02c112166d3c112cc07674a0225681e.camel@aosc.io>
Subject: Re: s-jtag on A33
From: Icenowy Zheng <icenowy@aosc.io>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	linux-sunxi@lists.linux.dev
Date: Sat, 19 Jun 2021 13:14:59 +0800
In-Reply-To: <c366547a-a19f-2673-d3c8-15771f565256@benettiengineering.com>
References: <c366547a-a19f-2673-d3c8-15771f565256@benettiengineering.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.10 / 10.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(0.00)[aosc.io:s=default];
	 RECEIVED_SPAMHAUS_PBL(0.00)[59.41.162.69:received];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DMARC_NA(0.00)[aosc.io];
	 R_SPF_SOFTFAIL(0.00)[~all];
	 ML_SERVERS(-3.10)[148.251.23.173];
	 DKIM_TRACE(0.00)[aosc.io:+];
	 RCPT_COUNT_TWO(0.00)[2];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
	 RCVD_COUNT_TWO(0.00)[2];
	 MID_RHS_MATCH_FROM(0.00)[];
	 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Queue-Id: E0AEA40CBA
X-Rspamd-Server: mail20.mymailcheap.com

在 2021-06-18星期五的 23:55 +0200，Giulio Benetti写道：
> Hello All,
> 
> present in sd-card on SDC0 I've configured those pins as jtag
> mux(both 
> tried 2 and 3 as values), but while Trace32 answers on jtag(PF port) 
> here it doesn't answer. I've double-checked with md.l under u-boot
> and 
> the values are correct, it seems something is missing.
> 
> So I've tried looking for PRCM if it has a jtag gate/reset but I
> haven't 
> found it except the ones for R_PIO etc. I also have a doubt that s-
> jtag 
> is dedicated to AR100 co-processor, maybe?

I think so.

> Kind regards

