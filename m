Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793368116;
	b=ARHUksxtkZu3Pr6v01SmI0VikK/R/0KItVeAkd8cBm8jjHkVS+qOHEmwlXlj514IUt6h
	 Ov0NHARxl1dZnMiB3IhBGD/cAxWq488fYu489bEVPUioGlX+IGtarJ+tMGhi6zBl2c1cq
	 ghuE3eSTBh9tjFbp9d1fLywlkIf8sPW4TLeFHS6zD0ySMmKv2tFN88SktyuUpeFw3W5gm
	 C8e5O1juGMB8lPPSgqQvJHMjWzv/nSoeOdWRvai++dknQWPxtJmOhZQuiWBhjBVeC2Q0Q
	 aH2J5V/SsF4HLrCI2nanLtSQjz0NK4yloM9X5o/R6zWXGIp05KpnQP3VPzGbs6C8TOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368116;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SmUXIOYlZlxH85m2DVy0bxyeuAHl0OHWFMsew9sjAhY=;
	b=pgkFYoex2vltcdM2OHwds9Y4yDhi6hi5UcQtlfWKWoqgpT1jhXf30wbTkCRHGaBm59xv
	 pmQ7EeMrrKy+jjXJ5RhbMvEph+DiLrzBAZ+90LIAO5lntFJa/QW+S8v8NmvhJcUCrvz22
	 FJ06k70a84QYaEPtggIiOv0J/Wu1Jb9MjlnVepio/nyi2Vz1ezGyHbCgG9b24ioxGwCPy
	 7fQWmzAYbtR6JxQq5BKkUsdA9nUaysg7oYp3qEFAOBvrjyVVVfLRJCf2Vynvf0bYWzvhU
	 79RSxP/baTbRH+DHCJjD+PJAUy82L0Nj6K16bus510eV+W9ZyN5IHVk2wndXjyMCwBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="c/DM/FsE";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h1tG+hey;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4D9606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 13:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4D9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c/DM/FsE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h1tG+hey
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGLqa2784406
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 13:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmUXIOYlZlxH85m2DVy0bxyeuAHl0OHWFMsew9sjAhY=; b=c/DM/FsE/PvGatCB
	uHka36ASu+RBqlZXDh5c8v44vLCvMz2Fnr+EuIlLGWP2mMLccbfKE+cOMDb3uuQz
	JtFSPlJv57t9N87udPL5JGi5jaQVD37tfqZsJVQSJzfgyp9yKJpmhaJH0pT2ndzF
	S7A2M1SDtNhxRq8PXeAw23yGyoLTMp3sfAWaCWi/ZurIet2YDe0WmR68qfxlJ+XS
	bgrGbP522PgSkVI85u73Z60H3ULAg2bgQ8e+a75pK4Dlisjw1S9yAkZO0jRgNEex
	ZY5Nrsi/BKmyhc49WC5EQl+1lyMzNnRdz1I1yn9zSusITE5lyA0PEOH9neHB4RVX
	BGsZ1g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk9yn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 13:48:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so615016b3a.3
        for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 06:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793368114; cv=none;
        d=google.com; s=arc-20260327;
        b=n4coic4A+2c19VgpExs6Q06AOi31KKft6XfpLTeapoBc3YBBiAuW2jIfuyaDyLxzzT
         WcRRZShOJdtnRcHvKzqg1DhSWQADCOJrAGGqyQbGFqotNSH1cG0v1/FBwUYoCcqJBxMd
         A1iSGz83i9388mz/SYCrNcaugawArsxzug8AHgsrUR/EQ59mwMfpINpWSRaglXc794vl
         8rgrg7H1XvdnhDTg4+wkmm8SbbCuHeSUYKm1sbj6068CHnvu34ZzC+OSDuGXuW5toFra
         2WaOtsXk305iIYQxFnuvztIqV9FCWUagWtfEsOwyJbwTEVtkJy446ylE1xwPrHa9YUdj
         RvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SmUXIOYlZlxH85m2DVy0bxyeuAHl0OHWFMsew9sjAhY=;
        fh=Xf5KMYK6Mp8TGlN+STQOZ5ALyBpOCHsfL+qV4UyS43A=;
        b=T8Tg5FiwfxYy9bWcBENrxcd3g6XQI6IRQMSELmSCWBdr+r9SgoN50fqooNXF4Ivgwl
         6/k5OZe9O8gS3vO8oifV9kQVHsA8v34SVTFS0pDDxt87AYcFwMgDtaojT0wNHkBtGr1e
         a+sP3SU8Z+KYQ6jZiwX74hBj54g2Ncg0mZ1XaZ9gd4JH/5pcD7/yVqYYLEl1hWoqqtXK
         TgxpByJYXPA3U2g2nBLY6D6kKSBdnv1VL8oBXPTZBMwrC0YMMirZrrZ89iIAQNsVMWTT
         LBJaE6BCBKxMIIIDuhpjJvCL2iGCl7zMPcOJynRqBHZOirL3W2EKxY37gUdroFafa2ui
         Fcfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368114; x=1793972914; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SmUXIOYlZlxH85m2DVy0bxyeuAHl0OHWFMsew9sjAhY=;
        b=h1tG+heygEVLGVNjmHsT71WOn+mg7Gh3Y9Dsdi0zRPNqB7gVkJ5ye/o/M4Z0TECoDl
         /cJ3F7OJy0M3IT/O5bNW2nPvqolpQ1UeGPKr7ComTrxVEc9BlxzKZn3o4W4QW5PvT3Pf
         sQ0DgUXhTjveB0rYKRUEnDHsIBSS/bCkYPyUlCacSqXbU9iUDO/U1TnfuR8H3OWd/59P
         xaxJiUvhZcfvaABZ8DXOXw+sek/lC6ICkVF/4YSqOnOpJ0l7oUjx+79fjHNedrZ8hwxW
         ptE9ecVJx3/zEIzMHKkw8xN6sIIs/fjLVBOmXN/QU1x04BydKmuEhoZnKx1fb6y3yGLX
         gepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368114; x=1793972914;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmUXIOYlZlxH85m2DVy0bxyeuAHl0OHWFMsew9sjAhY=;
        b=Ai1mdNI/UZ0KQMxP1+ItouD3vfkckT71i2nXIijwhNJaTBRTV3nX1FShxIa6a8Ko+E
         ZLjU4+dQUhNyWTMu7uiJxUUn7UJWBEN+wM0Uz2NCUopkdFWlJWDBj4Vo5d2iUdplwGa0
         LB/OxBm+C1N+Qo8/fLKJa0a7VILnZ+AyeKSdodudzzEs8cE4aStETWrpDB/jgxB2e0CE
         lsd6hCPzns9ViTZasCcqGCx0Ln1GvQBCBR8FJnGDvslNKjfmcTXr/g5QdosBTcvWPgus
         TkTb3cXSGrhNxb6bP8DlpsT3nNQ4tLvqvnBbqjzm8nHFy92DUDkWeli34KJtEC7t2SJB
         uemw==
X-Forwarded-Encrypted: i=1; AKwUvBxFLiWIhhwFHy9OzxbIlPdtTLsVStijDPt+AnKHZypjP38OPg9VUYNZzKQmRaekf8+5F6F+BS02XSHJiA==@lists.linux.dev
X-Gm-Message-State: AFq9FYL6QtUlv6XDgNFfEWSCt5QjCpnXxaMZzm8HDb2wE7EFhcPhldeU
	dfnUxmiOMtPzX7cs18/ekaap3kcoGXoWndggqAnsSBtmu1+toXNVIog+ddmc+i1duQ/4B3IlwOZ
	0JVh1uQQZdwLVz+vaIWSBDvxNgNP5WwJ7WY51gu82jCrUiKpbUOEESTw7QKCJoh+cI+yq1GpZti
	v6VWdRKpw/4bI4E2uPhOah+7CYr4O0O7zDKBI/YWWi
X-Gm-Gg: AYBFou23Cvsr625YNVdOEsp27JvmP7x/Hct5LqGq6oYMQpJ7Yqja2e7wROgjsEqWyAY
	KzIWPstohnJ82bcX0lzvFCko1YLImIq3edfyQ3r1kw7R2c7MxXMTE5dfzcSaGbVaAff/SAFao3I
	aWXkjzFMNBqygZsfTCqMANg18FSTCiLalrYfXd6szvHGZKsDb2SYbTPXkrCw==
X-Received: by 2002:a05:6a00:419a:b0:89e:e781:eec8 with SMTP id d2e1a72fcca58-8a9bea6ab26mr1853275b3a.27.1793368113521;
        Fri, 30 Oct 2026 06:48:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:419a:b0:89e:e781:eec8 with SMTP id
 d2e1a72fcca58-8a9bea6ab26mr1853252b3a.27.1793368112912; Fri, 30 Oct 2026
 06:48:32 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <179318778660.81375.11263258280496155344@manyhobbies.com>
In-Reply-To: <179318778660.81375.11263258280496155344@manyhobbies.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:48:19 +0100
X-Gm-Features: AclHuK9CCkGJy9uu3I3U-z2HN0uRBI4HDWUAxzxMZ9SG5mkVVBtQ_beC3L-ge70
Message-ID: <CAPx+jO_VxJctXCZMVdzeq4CX-Ru7ACM6=wQ7GMdG2+4F1pOcBQ@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: sunxi: reset the controller after an update-clock timeout
To: Tam Do <tam.do@manyhobbies.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae4a032 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=w2OPf45SAAAA:8
 a=BQrJblB4Y1Zt2l009CUA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=-iXIJKm6ftRzmWoHelNS:22
X-Proofpoint-ORIG-GUID: 2Kj3bGSsRkj7tWHyzFkKqE6sFYdRvGjW
X-Proofpoint-GUID: 2Kj3bGSsRkj7tWHyzFkKqE6sFYdRvGjW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX3DM0hgbiyzse
 Tesw9RR6wT1fykmh+04lafs+j2ZGglEBMfJ3ZAvVD/PDq/2RAN1svIK1uDLlSYjonzsASrhhcK9
 JKe5SUGsKrsbY2+8a7Yd5oHWPL2I5n6ykaK3bDMHyqUjsLnS0wo7EC5Orq9CYM2qfDbZGtDhrFj
 FLkqSZbqHQ/qouXxmXY/4HbYcBG8rJYiWaHjZtHYXLesf5UpD4/q0uks/36rREaYmnIKjgQwsS4
 f/P3tq3XEV4M7jP7k261zGSFpNXHO4aZYi+lrfINuMyhRtuSIy3qE30RourZNGr0sRjc/XNH16D
 vz6eIw4AwKiDrx+13pKj70m0LU/q6X9G1QH/nma+QfihfLcKhXwSMnlA85rLCfgPNCPlqOKRiCa
 kAvRhj9emV8SFtR8dvqS3trtcvIbNasxNrtj+uywlfPJEsRdeOUn6D2Pdto7kTI90LRbV2fUwoS
 prQV0gn9Et7+mc0QIRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX3TSjEdmd1HSA
 A3xNwpksmDniWT/I8cNdJsKnFwApPEr8TLbl9diCvbe22rrLh+n7F5oa6dfju4IrT99QCXQDAQj
 +Br0VN0h6M0cNfFc33b5v3OOt0VdXtw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

On Wed, Oct 28, 2026 at 12:43=E2=80=AFPM Tam Do <tam.do@manyhobbies.com> wr=
ote:
>
> If the clock-update command times out it stays pending in the
> controller, and every later clock update times out as well, so the
> card cannot be initialised until the next probe.
>
> This happens on an R16 board whose SDIO Wi-Fi holds DAT0 busy while
> its supply comes up during the first clock update.

It would be nice if you could elaborate a bit more on what goes on here.

I assume it's sunxi_mmc_oclk_onoff() that is being called and it's the
loop in there that times out. The question is then, under what
circumstances are sunxi_mmc_oclk_onoff() being called when we are also
waiting for the SDIO card to release the busy indication on DAT0?

>
> Reset the controller on timeout so the next attempt can succeed. This
> runs sunxi_mmc_init_host() with the interrupt enabled for the first
> time, so write REG_IMASK from sdio_imask under host->lock, as
> sunxi_mmc_enable_sdio_irq() updates both under that lock.
>
> Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found on Al=
lwinner sunxi SoCs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tam Do <tam.do@manyhobbies.com>

Kind regards
Uffe

> ---
> v3: take host->lock only around the REG_IMASK write in
>     sunxi_mmc_init_host(), not across the reset; v2 polled the reset on
>     jiffies with interrupts off. The return value stays unchecked, as in
>     sunxi_mmc_runtime_resume(): if the reset itself times out the
>     controller is wedged either way.
> v2: held host->lock across the reset (not posted)
> v1: https://lore.kernel.org/all/179307312104.39863.12372814163472848752@m=
anyhobbies.com/
>
>  drivers/mmc/host/sunxi-mmc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index fe4c0f6d73f3..55313780d06d 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -322,6 +322,7 @@ static int sunxi_mmc_reset_host(struct sunxi_mmc_host=
 *host)
>
>  static int sunxi_mmc_init_host(struct sunxi_mmc_host *host)
>  {
> +       unsigned long flags;
>         u32 rval;
>
>         if (sunxi_mmc_reset_host(host))
> @@ -336,7 +337,9 @@ static int sunxi_mmc_init_host(struct sunxi_mmc_host =
*host)
>         /* Maximum timeout value */
>         mmc_writel(host, REG_TMOUT, 0xffffffff);
>         /* Unmask SDIO interrupt if needed */
> +       spin_lock_irqsave(&host->lock, flags);
>         mmc_writel(host, REG_IMASK, host->sdio_imask);
> +       spin_unlock_irqrestore(&host->lock, flags);
>         /* Clear all pending interrupts */
>         mmc_writel(host, REG_RINTR, 0xffffffff);
>         /* Debug register? undocumented */
> @@ -688,6 +691,7 @@ static int sunxi_mmc_oclk_onoff(struct sunxi_mmc_host=
 *host, u32 oclk_en)
>
>         if (rval & SDXC_START) {
>                 dev_err(mmc_dev(host->mmc), "fatal err update clk timeout=
\n");
> +               sunxi_mmc_init_host(host);
>                 return -EIO;
>         }
>
> --
> 2.39.5
>
