Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794311392;
	b=00udQeQqzP4IOzJ+VSGgTBKgfnUMPErxzLwZqY93SqS9ArmuQXyzFbCdAOuAzwOTnhpC
	 dpoZrcTvOuRSvmYdVfFqH1i6AyH6azjZS1sKeRgsUHxwObUUsTvkqS1GI8o0j/ziexKik
	 KEIP82jAX6GG0dfLc6yXkWs7SuUXXuZc6d/Qh5vclDnt+wwEI9L6mzFYkOhUoUgi/pbsF
	 xyOUiN6cGxn0SSKfqDT64Hcpqu57EftF6z43Hi76n0VDK6+sh656ij/V/lJI/yFUonQF2
	 SZUszqwzpubEEmCanJ7Y9ENBrnGVQSjvJIy3riAbMsS6LCrrdczLKpiEl8bMpLxVl8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311392;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ieBvRnMfyX6acNHGZ0fpmazyXE/Jj6j0kfgwX5F7vhc=;
	b=O83xjE7nfnAwZ6d/j8j9JZT7VQ4CbQlU6JAPbQZqCZxG4rfrRXGrKZ/dyaBOFj49fBS7
	 5ASTHZ+bijjXlvWpjxyaObn9/yZZ8tYUMKW/TKJRQ6VGMqWEzSLKM/tRajtBJopeLfibb
	 4b7En+iz8hNC2UTk/1rYC0k7WPaq8K0jYEMGT6Y6/A2DamkvKPtjD5rW97wpHvVDAc0xd
	 sB5CZ+5c/avjCd3Kw750RKv7ckz82UUa8duO2cqT7AJLLmkvI3b3GNGr5UYwGKTbGAuFN
	 Xwnr5cADaeEQ25hEvm9Wn5AUmpeu02mgSf7LiHJOQHNKjALtZ35/JNWMgAIkwa7NGpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=osPyt+7g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="jMKo35/i";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24AE60A260E
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 11:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F24AE60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=osPyt+7g;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMKo35/i
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAB9uQo3195889
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 11:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ieBvRnMfyX6acNHGZ0fpmazyXE/Jj6j0kfgwX5F7vhc=; b=osPyt+7gO87BqXgo
	kNGr/upeu6G4kfXdw2aX0zXqPXCmquPlDq7nH1cAvHfynsrirh3/rsThl/93nwqb
	iukmzL/WJs7n7I7lwidTzPDRmCg5cmNJtyL5G1g3vaqwABcV8Lds5fyuMnC9T0rV
	r6/BOXltqjtxg2woCn6C/SA01smybM/L5NPV5LAQWJh0PTG+/a4vVY37VvDW7M1L
	oK0mps8+EelvvEFw9hKqN2uasifsRwfnnFgTgIzuZtBRJp5nSKUWMd4L0l84Tg6o
	0yEYhHgHuumeCFndoioCnqeRab3Hx0oxWoCqYF/DQ+KePgOUpjwwMGHQM3RZ/wTD
	LrFieg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03crm76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 11:49:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso1705982a91.3
        for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 03:49:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794311390; cv=none;
        d=google.com; s=arc-20260327;
        b=N3fe2TMR7dIeQVtEim5x3zKsxCjnHgSAwAtJU+2y14mi74IMtCu+DCYoLNu4MF2l1K
         ltmtC0tH9K2RnGRehPW9uJ9tx0zI+21Rrn4jAfzgZH7803p66Y+Wotu8+8LRzJapA2L8
         Cuei/el31lSbta1Qo72JuR9+qSZ9XAZtYiMt1Y9Af7u99CxmkZM8HHYiIuvyJvMGSfAS
         kQLpVxcE1b66PNd2W7yW4No63Ddk+sL6Rnonut24kjj0RVaSB90JPEjquvbnTSBwn5v4
         R35EO55NXkcrZCqwjwbCJm6UJUadrcSkZHHDRekWgFiH86LzDGR/m89+b6t/4ooKIUYP
         /pcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ieBvRnMfyX6acNHGZ0fpmazyXE/Jj6j0kfgwX5F7vhc=;
        fh=bBaScgSE5zpWi2vll7u01GCW/vMju/PUgJfc0KM+25o=;
        b=DpDyh/OyBfqfp0HbeHj9mVy3sxaeDYC1Y1DgvhzPXuiC+erBMezBl0/ysq7KS+Nh+f
         iTYZjbmTBHwi5W4jA38e6R6Ng+bS3p3h0t1WpKGEtjpOWuG8XG0VzIZ/+Vd1OkGdrnmd
         hokhpo8/qVUJcBjXdLHC2gcB9b7RuXGCVSwb1v5+i35ZZs6Yj9kl+MmL9ecmyFjPsJF6
         q9bKcqJKOd1AlfCs6OsPZm6ZtIJ5f2zO1LfENY9rWW9GkmbNUhZMOBsGJhY78Z1ux/SJ
         rD/SmBXgs1Z8GmoV3zjP5YNOJrWgjSOxZvjwFgSv9YtmyjovO0A1Jhs/IX5LWITDYpdH
         OBEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794311390; x=1794916190; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ieBvRnMfyX6acNHGZ0fpmazyXE/Jj6j0kfgwX5F7vhc=;
        b=jMKo35/i0KNyn1EhLjMBGQKadETiq8RyF/kchdfZjqxDNUxnWe0uYDQP9QDl+L3dgO
         GEwcbT2u6YSkjntfGzeEEV4YkneWctIeVyTPn1+0VrLsvkWujyf0XxhJgjNXzDSNAKYB
         SLxwoSbU4MiM66Ujnw4N1lGzqlXMqoOcSm+vL4daMsFWAU2d1O3kyBYT4U9Y72S1dMBz
         zpuu6ltxVBkEgwc6imije1Ed1g23PNs073yF4GGCFh7oK5qflBHfJsPfNwIpgvxyHaUh
         3sc+XnsaabJFNwxHbavRATlToiKWmam55b83msEnxcU31TmckE08Djm9IsyWmh+NqrYf
         TGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311390; x=1794916190;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieBvRnMfyX6acNHGZ0fpmazyXE/Jj6j0kfgwX5F7vhc=;
        b=fZ6L9W7jyKkANvTFRje+Mnuih4vabd8Jrfq0xOgoF93ECHwJ1HTVzcyjUr+i4B7TNd
         naGvGV07FAcW1sOue1WaekrU842wUWtv1tG9z0SUxmFWugpbOdUOx5VGqtSP9MOkaBsn
         0GYdEA/GXOFl0acHphuWK0+QCFdvwtOXr+UGT5uVnOinj8AEr082L2hv91wkzvIbE06d
         aQFMZa/VB2khwxGxfr/4uShr0n54w+oYRDPRojvDawD0SPeJpd0PC5xpgYkX0uZWHQCA
         YyPZvwYSHl5V1ejnAw3L9gxRSLqz2OHP3YXLIOUkfaNC/VtjxCxDjtB4cpnYZmH2vLEW
         JEvQ==
X-Forwarded-Encrypted: i=1; AL+hErG+M/BtSAIvghmEg5ymQBMoauhkNCVRYpTnK6TPcGYJ5wLcht/w6p/e2HYKfbRmPYzJ1bYFb8ZbnV3yKg==@lists.linux.dev
X-Gm-Message-State: APuU4Z93BXnVveRd9GV8//FISuzB8ySufEMMkZETyHdzOHRx0eFkL+5X
	zkYSWFr16CjQSeUleefEGidf8jTLHKYdvZFPcEfabbYgfGACe2BlGe8Q/t88smSQL2pKtR0kv85
	evamHa2hp+RG7rhoMQ8pvAlBPE+iPOHX9Ln6LftRsgggyDN+X0v0UClcJ9TnkPT5bh3Y/VjSV9q
	IrMzNlRLxJZ0WM+RchuJ26QqeynLhfewRbqDFDGSb7
X-Gm-Gg: AYBFou1pdjUWgoASP1upqB1ig1gas9EK6IzJWaKWphNqPR9Y1vNl3yGvyul/qmvWb5A
	zLY2t4ZIqLEO4wzdNss9bgPNFFM3GFFcIUtAN0mfGlG0VAhXGnMA/CLfLH1hmDBOBsn+FNJGAOL
	dwIBt2J4NWaSikFPCPZwlyaGf61PzEl18R7QbHtDsu5E5UUzWmM+yv1LWtxw==
X-Received: by 2002:a17:90b:4405:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3b1669f84c5mr2551051a91.0.1794311389505;
        Tue, 10 Nov 2026 03:49:49 -0800 (PST)
X-Received: by 2002:a17:90b:4405:b0:3a7:9adb:2a0d with SMTP id
 98e67ed59e1d1-3b1669f84c5mr2551032a91.0.1794311388919; Tue, 10 Nov 2026
 03:49:48 -0800 (PST)
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
 <CAPx+jO_VxJctXCZMVdzeq4CX-Ru7ACM6=wQ7GMdG2+4F1pOcBQ@mail.gmail.com> <CCF5CCC2-2C9F-4E5A-8550-B8C64CD7F404@manyhobbies.com>
In-Reply-To: <CCF5CCC2-2C9F-4E5A-8550-B8C64CD7F404@manyhobbies.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:49:37 +0100
X-Gm-Features: AclHuK94rNqkXJQ-LJt7eo296GzqJBUJ5kGEs9mLdz46FPtkzJbBx9mV1nByLpQ
Message-ID: <CAPx+jO996hZ1H+RTYeVc66PCvnYOV=m3PNY4Xjcc=+jdcBVXwg@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: sunxi: reset the controller after an update-clock timeout
To: tam.do@manyhobbies.com
Cc: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 0aWLnmJa4LeNtF0cyHRzC34R8abrizRW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NyBTYWx0ZWRfX9VkbSzTzZlQo
 m5m0dRNSfkiAiViclo0vuFEG5+z9R+MgdPhlOsK+Z0cBqr18kY5T7n+5LW9/JAdLgKETjQMKw8R
 gQqHZY/Z6KiXjdOslkY1Bw6clOy7x1s=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af304de cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=w2OPf45SAAAA:8 a=EUspDBNiAAAA:8
 a=hraAJGsaz5TtD8VhunUA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=-iXIJKm6ftRzmWoHelNS:22
X-Proofpoint-GUID: 0aWLnmJa4LeNtF0cyHRzC34R8abrizRW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NyBTYWx0ZWRfX+c26Vt8Mwpi9
 3OfQg7CwgHcXHAVcqarxF2HCnlMp0rRGoMULtW166/5vCW2d6ENJG4/11W359PxsLhXYQtgMxmg
 1g3ftivzWhZHRCHz3en2klh7SrA1TkXSwigPo69MtVG5rx/8ouIFA2hMofnZbfzlZ0sO4XJTIIL
 6FWnlFnEdUCJaLTqWEoUJA+EVwpia14E0GGJcQeXiLz1t0iQ9fBvNyOEmlqLpjQXWs+ajqh+TQr
 wCVj8CaBe8hw/s1FwYfuL9mM1eEbsEVStAySRHS+kMlf4kulpIcAvR9tc5HID6URkeUV5G9Tm0u
 L/FPNXS6N9uobfg+V8I4TWK7j5x0tGqLwiIO2QqFgJYIqRYfNW7rrTwzXYpko62wZAz8IiTVQSy
 rj1QJ3DKo25kpdx4TMeRL/ZzudNWQvStQF+BkaHxKfnfvB7xjbTz0Xt73S5ezqsppUABlYUJEzf
 XnMQiXBHvctGSgJ1rJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100047

On Fri, Oct 30, 2026 at 11:41=E2=80=AFPM <tam.do@manyhobbies.com> wrote:
>
> > I assume it's sunxi_mmc_oclk_onoff() that is being called and it's the
> > loop in there that times out. The question is then, under what
> > circumstances are sunxi_mmc_oclk_onoff() being called when we are also
> > waiting for the SDIO card to release the busy indication on DAT0?
>
> Yes. It's the first update after probe, from the MMC_POWER_UP set_ios:
>   sunxi_mmc_oclk_onoff+0x17c/0x1a0
>   sunxi_mmc_clk_set_rate+0x1c/0x2c8
>   sunxi_mmc_set_ios+0xe4/0x144
>   mmc_power_up.part.0+0x40/0x150
>   mmc_start_host+0x90/0x9c
>   mmc_add_host+0x6c/0xa0
>   sunxi_mmc_probe+0x35c/0x478
>
> STAS already reads 0x206 there, before anything has been sent to the
> card; on good boots it's 0x106. So the card is holding DAT0 when Linux
> takes over. These are warm boots from the vendor firmware and it
> happens on roughly half of them.

I see. So perhaps check DAT0 during the probe and make a reset already
at that point instead?

>
> The supply explanation in the commit message is wrong, sorry. The rails
> are up ~20 ms later and the command is still pending at the 750 ms
> timeout. From then on every update times out until the controller is
> reset. Rebinding with the card idle never hit it (0/20 tries).
> I'll fix the commit message in v4.

Thanks for the explanation. I will wait for the v4 then.

Kind regards
Uffe

>
> Tam
>
>
> > On Oct 30, 2026, at 8:48=E2=80=AFAM, Ulf Hansson <ulf.hansson@oss.qualc=
omm.com> wrote:
> >
> > On Wed, Oct 28, 2026 at 12:43=E2=80=AFPM Tam Do <tam.do@manyhobbies.com=
> wrote:
> >>
> >> If the clock-update command times out it stays pending in the
> >> controller, and every later clock update times out as well, so the
> >> card cannot be initialised until the next probe.
> >>
> >> This happens on an R16 board whose SDIO Wi-Fi holds DAT0 busy while
> >> its supply comes up during the first clock update.
> >
> > It would be nice if you could elaborate a bit more on what goes on here=
.
> >
> > I assume it's sunxi_mmc_oclk_onoff() that is being called and it's the
> > loop in there that times out. The question is then, under what
> > circumstances are sunxi_mmc_oclk_onoff() being called when we are also
> > waiting for the SDIO card to release the busy indication on DAT0?
> >
> >>
> >> Reset the controller on timeout so the next attempt can succeed. This
> >> runs sunxi_mmc_init_host() with the interrupt enabled for the first
> >> time, so write REG_IMASK from sdio_imask under host->lock, as
> >> sunxi_mmc_enable_sdio_irq() updates both under that lock.
> >>
> >> Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found on=
 Allwinner sunxi SoCs")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Tam Do <tam.do@manyhobbies.com>
> >
> > Kind regards
> > Uffe
> >
> >> ---
> >> v3: take host->lock only around the REG_IMASK write in
> >>    sunxi_mmc_init_host(), not across the reset; v2 polled the reset on
> >>    jiffies with interrupts off. The return value stays unchecked, as i=
n
> >>    sunxi_mmc_runtime_resume(): if the reset itself times out the
> >>    controller is wedged either way.
> >> v2: held host->lock across the reset (not posted)
> >> v1: https://lore.kernel.org/all/179307312104.39863.1237281416347284875=
2@manyhobbies.com/
> >>
> >> drivers/mmc/host/sunxi-mmc.c | 4 ++++
> >> 1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc=
.c
> >> index fe4c0f6d73f3..55313780d06d 100644
> >> --- a/drivers/mmc/host/sunxi-mmc.c
> >> +++ b/drivers/mmc/host/sunxi-mmc.c
> >> @@ -322,6 +322,7 @@ static int sunxi_mmc_reset_host(struct sunxi_mmc_h=
ost *host)
> >>
> >> static int sunxi_mmc_init_host(struct sunxi_mmc_host *host)
> >> {
> >> +       unsigned long flags;
> >>        u32 rval;
> >>
> >>        if (sunxi_mmc_reset_host(host))
> >> @@ -336,7 +337,9 @@ static int sunxi_mmc_init_host(struct sunxi_mmc_ho=
st *host)
> >>        /* Maximum timeout value */
> >>        mmc_writel(host, REG_TMOUT, 0xffffffff);
> >>        /* Unmask SDIO interrupt if needed */
> >> +       spin_lock_irqsave(&host->lock, flags);
> >>        mmc_writel(host, REG_IMASK, host->sdio_imask);
> >> +       spin_unlock_irqrestore(&host->lock, flags);
> >>        /* Clear all pending interrupts */
> >>        mmc_writel(host, REG_RINTR, 0xffffffff);
> >>        /* Debug register? undocumented */
> >> @@ -688,6 +691,7 @@ static int sunxi_mmc_oclk_onoff(struct sunxi_mmc_h=
ost *host, u32 oclk_en)
> >>
> >>        if (rval & SDXC_START) {
> >>                dev_err(mmc_dev(host->mmc), "fatal err update clk timeo=
ut\n");
> >> +               sunxi_mmc_init_host(host);
> >>                return -EIO;
> >>        }
> >>
> >> --
> >> 2.39.5
> >>
>
