Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795516251;
	b=YTKvO8mo4nW5iq1Lya9Hzjo6JnkQkoXInILQ+TZVNKIFjoKjLEo9O82HvhFv9EQjNr2j
	 TJ50jjb2G46OAYUmb7kJFdzxaC2wchcR4e0gO0O2jZtGcDe0PTrocBNTHGDG1Vgz9FEaf
	 IwIb1HSZPabr38QRB9TkFRN0hwZa66ah/j1qgW9b+efoz+i1bgrAZ1aOBKji7KVcuwzaM
	 mWOG/IALC92ZeC2FMNbNhvkjUYmBjgVgFdgBn4/H6mX/Bq3ySyNGVuNT30FZIyx8/fBbQ
	 APEsfqjAavSNAiikqoUMtZ5XgMsJ1yzm4OitAJDxxOGWmr9U8n89KqDXoDdsjUpDilQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:
	 X-Google-Nh-Sender:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=V5Z9ALfKyJ3P8ihVvFWgXTZSkaDglfsx844trCqdi7A=;
	b=A5sij8Gj9w7wf60LINHmlbihiEmhzrTF0M6NPvhoddH+fro3U2vmDWXv7RSP2QtCRYWi
	 mSKCUrtKGsuO5gum99y8/9qXGr91/Z63wOfrH7YtxnbvRtaz6H+sRfo0CYGHmntYia+UR
	 PPb7X8O7u0RkM9O4S89un7dgMmJ4r/MJ/pnTqROKljNF2RoniDDVIBmXggjLuafkpyNDb
	 uxDHeRT75VHCCmRhI1PGp2nfIAt13B8txii6AnYITdntWfWPx4Ndidz0OEG1KhkVw9w9R
	 2+UiXwGH8NrWpJGnYWtE2U3XyAqGo/4kB7ZbfDK9HAMMaX6sjb7WsQkH6hCzFw+WW2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P1vHQAn9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53515606A330
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 10:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53515606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P1vHQAn9
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so5306523a12.3
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 02:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795516250; cv=none;
        d=google.com; s=arc-20260327;
        b=r9d44rCsnCUlsNg8PA+3pxVZ9Zs4fiwFmn7GCDuB7eQoGLGTA+2T+94GyC3QKl78c8
         YqvEz54Eq9Z2d8+HzEHQJHVP3WtEL9pnTGHSXLIte2Ze9feD4rf5OfP84ESmY4UMG87O
         CyV95MTVqlJFM+WPa2tG4bOx2XCuPEDyQKIOeNQV/5DcQyGNCho2rVa17rGe+UOcd9Pl
         A7ripYKsx0MQVwCWHnufrkxgiC7BVUXzz0K5FaOqs1+TjcHqjzSWnTXdl3g8tn64rQoI
         Ghru4v7JeWT51d7zxbu49LE3d89n3w1JgU/0oGPppPFij1uXJNTvsRwR3cQgKi+KLOsg
         2tQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=V5Z9ALfKyJ3P8ihVvFWgXTZSkaDglfsx844trCqdi7A=;
        fh=tTko2b7LahzhZXvvjoa8ahZMxoSY8UZff4rmVu3r0z4=;
        b=JlvFQseHCncwrIY5y2uhNNp3y/he3AomtWKbb7PuLEg9tghQaTz9kVKafjznuXzWk+
         82Ia2xB0gUqm6TLNYUPlXpK211DTiaApDiwW2xVksW1qUK6ApbGmpuFJb38XXlb9ggP3
         qKvvCan8XmD2JEzeAtoCIMSzMMC+3jyRlzqcsI1/tsA40o97s/kqsPz737/sWeJthmDT
         JKrsROqIMrC6L60P7H5IY7wwM1ggm+JGML3WU7qBwbuES9vKWWOIinHHZxyNUM/wv/vy
         o8ATFxtpp9vi37gRo1BOLO914jC27Hg6fD7geSrLDgttJ/sFsltz79LIYRIlpiKnKoZT
         iOYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795516250; x=1796121050; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5Z9ALfKyJ3P8ihVvFWgXTZSkaDglfsx844trCqdi7A=;
        b=P1vHQAn9TwKkIAwh/vXMjLt/ik2F6UmICGqdm67z2jHia0IlanLEpPT9lhhCmTfQhC
         2yUy16bd8p++FugiyyQQ89syXy+JZfNvKopy1kFwSmikytubHtTTudNQBnK4wjMYp+73
         RtApKc7p4FFaFHZnYM/RFWRGsTqCx1yVjWlKVNNycEc3UpYYclVi3BdmeqmC+51kRw+s
         2muGfQNsTYBfH2Iu0NggY6hkItbUeZ5o2B7udtR9xLn6id8VbGzSEa6unWraepwCsg/o
         H1JQUcW8Zok5yxymNAe7FgLIkVxtO0cnY38k3f9hWRthoky2tQfdhHFzshMqDMHOSXdA
         Kbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516250; x=1796121050;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V5Z9ALfKyJ3P8ihVvFWgXTZSkaDglfsx844trCqdi7A=;
        b=JIe3QeHA1fy34ZE9a0rn0BvgKHNlPdxR+MFLUO7rSUjtNQ2AjUTQutAo9MZMYwFiy/
         38D8Q0mLvxAGe9qHXXskEOVNGsFBIIpSWLfQyR6VRllezSUxihcVT9fmA3Yo7AcwpYQF
         pa+gdsPQ8q8F+pvrhRs2BBPrO0lyEH9p0PD7J6kH3J4x6wWMoLWOXELvce3lMWRKMT6i
         RFHqul9IdJEOOAI7hFgrvvdZCdt2QYM8OWVzZ0kWPAhzPalIjNtvTkq+HmaGkTVNPGMi
         mzIHz0UT1l5J1kEU58pPY91WzdHwuPRsyrI/RPYboG5mdrI4RdUm/8utFAYwMTFO/6k2
         LtqA==
X-Gm-Message-State: APuU4Z9ysbaywP2vLNM30uDMl1hBlv+rLwrmp924A2VmaUyecFA9FrKk
	MKA6rjQ96beZyMfi8k2X+8ZwVuLF1GxCOWWB+XsKN/ji/aFzYmJRfeIKFDaWVTgyT64mvv/NVvx
	gYfnATrOYUoIi0K2KmFXLk6/N5bXIbWx30Q==
X-Gm-Gg: AZFdTZc30RZurGyuj7jdV4Gjuhvqba4CnSLzy8xQ3qXo5YJ4XDIgxuQCSUEQkNrg4V4
	rfn11eqWyFAQfh9rJRohiS26qA1FqykppO4AxOUdvztadAkYWSzFCCG2eMlbMOCiXmpn7GtyR0V
	i6+qXaC7E31ylqBWazgUQGrp6T6ocVDu4SXrqwnwh7ag2hQ6I8nWSbgqpP2x4cBdRNYRVeIMXej
	Ek4Wm/G3skOsibSFAOHKzkJ8QNHKpgazYeXA2dggs4FJ+5Yp2VHBUTJmVIYj84lTSvNiz1oaYsb
	PfkCtq++WKUdNIE33Gtj/wiUUqB+hlDdfBqqAGjzyhHZq/ZsNqMKLU/kTjXguXymnzhmGmLcCgm
	HdKyBnEEbr3o5dZTrurshbfjyYEhFt/jvhejdquHR4EYhN3o20gEJrs1nMDVgE0nGC2Q6
X-Received: by 2002:a05:6402:1e94:b0:6b5:8247:7bc7 with SMTP id
 4fb4d7f45d1cf-6ba37ed4f03mr11320419a12.44.1795516249460; Tue, 24 Nov 2026
 02:30:49 -0800 (PST)
Received: from 652928176132 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Nov 2026 05:30:48 -0500
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Midgy Balon <midgy971@gmail.com>
X-Google-Nh-Sender: AW_J_UohpoGK-DiG--rcbsCI8AsZLONM2vBtfHy231vCwVdVxPkOAfYi7PeJIuYRtU2YTvT82Ek593-S51ejuoQR87ccAAWrFypPwSH-0I2NTaNO9VsKzv9Q9jldI9WlyhAgWfLoNqCs9jV7XlOKSrcM4hN_bStEca4vKrbtPH9pOyrsj1pvLolGB0ocmcARI8wEVu0LpA1_LWTbH835MNHgi7vDJzWeFUTJkXpGnllaK8VIpgczHqq-OSmGDvGHaV-mR03rLJh9nA
Date: Tue, 24 Nov 2026 05:30:48 -0500
X-Gm-Features: Aa3M54q5eCiCH6Q_-qn0MTfN3MG1GGpi2NXZ8YNkxoUxGHTPuXl1I0l9-pJVYHQ
Message-ID: <nh-c1d9e3e3-2e64-4a73-b38a-db4eb4cc5a38@google.com>
Subject: A523 (sun55iw3) DE33/DE-v35x: DE accepts config but no frame ever
 clocks out to the TCON (DSI panel black)
To: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm mainlining the Trimui Smart Pro S (Allwinner A523 / sun55iw3, DE33
=3D DE-v35x/de352).
Everything works except the panel image: backlight on, DCS init ACKed,
D-PHY PLL locks,
and every driver-controllable register byte-matches a live capture of
the vendor firmware
on the same board =E2=80=94 yet the DE never completes a frame, so no pixel=
s
reach the panel.

Pipe: tcon-lcd1 @0x5502000 -> dsi1 @0x5508000 -> combo D-PHY
@0x5509000 -> 720x1280
command-mode DSI panel (drivers: sun4i-tcon, sun6i_mipi_dsi,
out-of-tree sun55i_de RCQ
backend on v7.4-rc1). Tree and full register evidence (live reads,
stock oracle, ruled-out
list, one-shot probe results):

  https://github.com/MidG971/trimui_smart_pro_s/blob/main/docs/A523-DE33-RT=
-HANDOFF-QUESTION.md

The short version of the evidence:

- In DSI video mode the TCON timing runs but the DSI FSM parks at instructi=
on 1
  (debug_inst=3D0x00100000, video_curr_line stuck 0) vs stock at
instruction 3/HSD with the
  line sweeping; the TX FIFO only carries idle/blanking packets.
- In the stock-matching 8080 command mode (CPU_IF=3D0x10010005, manual
trigger, TRI3=3D0 =E2=80=94 all
  byte-matching stock) TRIGGER_START is never consumed and
CPU_IF.rd_flag never asserts.
- Instrumented probes: a single full RCQ/AHB arm gives FRAME_END 0/300
over 60 ms; one
  dirty RCQ head + kick applies within 50 ms (ACCEPT 238/250) but
RCQ_FINISH stays 0/250.
  So the RCQ walk runs, but FRAME_END/RCQ_FINISH are not gated on the
DMA =E2=80=94 they need a
  frame actually clocking out to the TCON, which never happens.
- Found+fixed en route: our size registers had w/h transposed
(0x02cf04ff landscape
  programmed for a 720x1280 portrait fb); now 0x04ff02cf, verified live.

Questions:
1. On the A523/T527 DE-v35x, what makes the RT engine clock a frame
out to the TCON =E2=80=94
   i.e. what raises GLB_STS.FRAME_END / lets the 8080 rd_flag assert =E2=80=
=94
beyond the
   registers above? Is there a TCON->DE frame-start/sync wire the
mainline path misses?
2. What is RCQ_FINISH (GLB_STS bit2) gated on, given a kicked walk
that applies its data
   never reports FINISH?

Happy to run any further read-only probes on the board.

Update 2026-11-24: found that the v35x BSP disables the VSU scaler for 1:1
layers (de_rtmx.c scale_en=3D0 -> de_vsu_disable()); our driver ran a unity=
 step
through the VSU (VSU_CTL=3D1), which can stall the UI channel datapath. Byp=
ass now
applied in our sun55i_de.c (VSU_CTL=3D0 for src=3D=3Ddst) and a fixed modul=
e is built;
on-device test pending (board currently down). If anyone has seen this on
A523/T527 DE-v35x, a pointer would still be appreciated.

Thanks,
Midgy
