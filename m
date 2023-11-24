Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE702C1AE
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Nov 2023 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSlWoA77"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3b8382b8f5aso1215625b6e.0
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Nov 2023 07:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700838527; x=1701443327; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOCl1swrFbW/7sFUtbSrbFab89YweYfN5WTmXg3TDK4=;
        b=HSlWoA77HAfNEu+F2R6gRfeJYZ9CNEoFQd37w7SkM2g5T/HWCNwq5HHUuhTcyBnKnm
         AbtKetB1oUCoLAYx/TNqa4M1QPXBtrVLYllbmmKLgwkMZE1ktNFDbRW+hB63zjuFsdoY
         cPhczcVw951mcjMJwHXlyCZrCEU7N+SBR51/+BaD4UGHF7l5UR60kbWwiGIl9AkZGZtq
         TmrBwPBh7Jx6GVV8y1oDsM5EbtBpVYfL6jTboSj6qO5AQENlMFz5aFcH5N1WRF9LTm7I
         18IP5OOnYbJA+Ay4FahJe92eZRlqnmsvwN+UJCXeFhdmUoCnye2zt8n/OGmHdXMvqP7P
         GSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700838527; x=1701443327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOCl1swrFbW/7sFUtbSrbFab89YweYfN5WTmXg3TDK4=;
        b=NVLB5AdiNUon25meD42nOlLrtrwAJ1+hRJX1dsNo4RDaQU17tgA12PM8R6+vck+2Nv
         MZxGdoc6EyiEIpaX9Vt/8vy/R/diY3UOuGrMAJwok8Ka80EyQ3srCbLNNz52dCD3R+6b
         ldXR0FdGebzCS0nASdIJMCDrrD2S+BcbhM8aoJ0JREr5Qxlh4UavraA0WSCq/qo7/Rws
         EA6RU9i1Y60LBLQuMFOHB2c9iNhMxBMkX7F4Xd0H34fHqv+Zhs7O/VOV24MGDiiBNJt1
         XhEV6Sqo1FH8ffZ9HGduRijpgC9nhQ/qkPTjrlFXVYVK6SYrGVc5b0fMhDU9A0ca/mTn
         BvOA==
X-Gm-Message-State: AOJu0Yzodv2bqMNCWvrgLVuIUX+yFBP101MHlXIXZfsPn0hqO3dqNhtZ
	y6MUm+N7FfmMPJEryW4tixH8bq1bqxS4sreeids=
X-Google-Smtp-Source: AGHT+IHbug40/QYz+/7p5JxTk4BbKhmH+Y2/rax9GKSlZ7ONB0Q5R/TbT3m8srbn2jl1Ir5SdK3oYg2mW7a0rR13vWY=
X-Received: by 2002:a05:6358:611e:b0:16e:29eb:98c8 with SMTP id
 30-20020a056358611e00b0016e29eb98c8mr676506rws.30.1700838527192; Fri, 24 Nov
 2023 07:08:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-14-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-14-peterlin@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Nov 2023 15:08:21 +0000
Message-ID: <CA+V-a8tozeqAN=R1UHciT=hOCcnSRack=h3gpb3=pytQY9TpAQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/13] riscv: andes: Support symbolic FW and HW raw events
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, ajones@ventanamicro.com, 
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org, 
	devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com, 
	geert+renesas@glider.be, guoren@kernel.org, heiko@sntech.de, 
	irogers@google.com, jernej.skrabec@gmail.com, jolsa@kernel.org, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	locus84@andestech.com, magnus.damm@gmail.com, mark.rutland@arm.com, 
	mingo@redhat.com, n.shubin@yadro.com, namhyung@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, peterz@infradead.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, rdunlap@infradead.org, 
	robh+dt@kernel.org, samuel@sholland.org, sunilvl@ventanamicro.com, 
	tglx@linutronix.de, tim609@andestech.com, uwu@icenowy.me, wens@csie.org, 
	will@kernel.org, ycliang@andestech.com, inochiama@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 12:19=E2=80=AFPM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> From: Locus Wei-Han Chen <locus84@andestech.com>
>
> This patch adds the Andes AX45 JSON files in the perf tool,
> allowing perf to be used with symbolic event names.
>
> Signed-off-by: Locus Wei-Han Chen <locus84@andestech.com>
> Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
> Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> ---
> Changes v1 -> v2:
>   - No change
> Changes v2 -> v3:
>   - No change
> Changes v3 -> v4:
>   - No change
> ---
>  .../arch/riscv/andes/ax45/firmware.json       |  68 ++++++++++
>  .../arch/riscv/andes/ax45/instructions.json   | 127 ++++++++++++++++++
>  .../arch/riscv/andes/ax45/memory.json         |  57 ++++++++
>  .../arch/riscv/andes/ax45/microarch.json      |  77 +++++++++++
>  tools/perf/pmu-events/arch/riscv/mapfile.csv  |   1 +
>  5 files changed, 330 insertions(+)
>  create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.=
json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/instructi=
ons.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/memory.js=
on
>  create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/microarch=
.json
>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json b/=
tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
> new file mode 100644
> index 000000000000..9b4a032186a7
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
> @@ -0,0 +1,68 @@
> +[
> +  {
> +    "ArchStdEvent": "FW_MISALIGNED_LOAD"
> +  },
> +  {
> +    "ArchStdEvent": "FW_MISALIGNED_STORE"
> +  },
> +  {
> +    "ArchStdEvent": "FW_ACCESS_LOAD"
> +  },
> +  {
> +    "ArchStdEvent": "FW_ACCESS_STORE"
> +  },
> +  {
> +    "ArchStdEvent": "FW_ILLEGAL_INSN"
> +  },
> +  {
> +    "ArchStdEvent": "FW_SET_TIMER"
> +  },
> +  {
> +    "ArchStdEvent": "FW_IPI_SENT"
> +  },
> +  {
> +    "ArchStdEvent": "FW_IPI_RECEIVED"
> +  },
> +  {
> +    "ArchStdEvent": "FW_FENCE_I_SENT"
> +  },
> +  {
> +    "ArchStdEvent": "FW_FENCE_I_RECEIVED"
> +  },
> +  {
> +    "ArchStdEvent": "FW_SFENCE_VMA_SENT"
> +  },
> +  {
> +    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
> +  },
> +  {
> +    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
> +  },
> +  {
> +    "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
> +  },
> +  {
> +    "ArchStdEvent": "FW_HFENCE_GVMA_SENT"
> +  },
> +  {
> +    "ArchStdEvent": "FW_HFENCE_GVMA_RECEIVED"
> +  },
> +  {
> +    "ArchStdEvent": "FW_HFENCE_GVMA_VMID_SENT"
> +  },
> +  {
> +    "ArchStdEvent": "FW_HFENCE_GVMA_VMID_RECEIVED"
> +  },
> +  {
> +    "ArchStdEvent": "FW_HFENCE_VVMA_SENT"
> +  },
> +  {
> +    "ArchStdEvent": "FW_HFENCE_VVMA_RECEIVED"
> +  },
> +  {
> +    "ArchStdEvent": "FW_HFENCE_VVMA_ASID_SENT"
> +  },
> +  {
> +    "ArchStdEvent": "FW_HFENCE_VVMA_ASID_RECEIVED"
> +  }
> +]
> diff --git a/tools/perf/pmu-events/arch/riscv/andes/ax45/instructions.jso=
n b/tools/perf/pmu-events/arch/riscv/andes/ax45/instructions.json
> new file mode 100644
> index 000000000000..713a08c1a40f
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/riscv/andes/ax45/instructions.json
> @@ -0,0 +1,127 @@
> +[
> +       {
> +               "EventCode": "0x10",
> +               "EventName": "cycle_count",
> +               "BriefDescription": "Cycle count"
> +       },
> +       {
> +               "EventCode": "0x20",
> +               "EventName": "inst_count",
> +               "BriefDescription": "Retired instruction count"
> +       },
> +       {
> +               "EventCode": "0x30",
> +               "EventName": "int_load_inst",
> +               "BriefDescription": "Integer load instruction count"
> +       },
> +       {
> +               "EventCode": "0x40",
> +               "EventName": "int_store_inst",
> +               "BriefDescription": "Integer store instruction count"
> +       },
> +       {
> +               "EventCode": "0x50",
> +               "EventName": "atomic_inst",
> +               "BriefDescription": "Atomic instruction count"
> +       },
> +       {
> +               "EventCode": "0x60",
> +               "EventName": "sys_inst",
> +               "BriefDescription": "System instruction count"
> +       },
> +       {
> +               "EventCode": "0x70",
> +               "EventName": "int_compute_inst",
> +               "BriefDescription": "Integer computational instruction co=
unt"
> +       },
> +       {
> +               "EventCode": "0x80",
> +               "EventName": "condition_br",
> +               "BriefDescription": "Conditional branch instruction count=
"
> +       },
> +       {
> +               "EventCode": "0x90",
> +               "EventName": "taken_condition_br",
> +               "BriefDescription": "Taken conditional branch instruction=
 count"
> +       },
> +       {
> +               "EventCode": "0xA0",
> +               "EventName": "jal_inst",
> +               "BriefDescription": "JAL instruction count"
> +       },
> +       {
> +               "EventCode": "0xB0",
> +               "EventName": "jalr_inst",
> +               "BriefDescription": "JALR instruction count"
> +       },
> +       {
> +               "EventCode": "0xC0",
> +               "EventName": "ret_inst",
> +               "BriefDescription": "Return instruction count"
> +       },
> +       {
> +               "EventCode": "0xD0",
> +               "EventName": "control_trans_inst",
> +               "BriefDescription": "Control transfer instruction count"
> +       },
> +       {
> +               "EventCode": "0xE0",
> +               "EventName": "ex9_inst",
> +               "BriefDescription": "EXEC.IT instruction count"
> +       },
> +       {
> +               "EventCode": "0xF0",
> +               "EventName": "int_mul_inst",
> +               "BriefDescription": "Integer multiplication instruction c=
ount"
> +       },
> +       {
> +               "EventCode": "0x100",
> +               "EventName": "int_div_rem_inst",
> +               "BriefDescription": "Integer division/remainder instructi=
on count"
> +       },
> +       {
> +               "EventCode": "0x110",
> +               "EventName": "float_load_inst",
> +               "BriefDescription": "Floating-point load instruction coun=
t"
> +       },
> +       {
> +               "EventCode": "0x120",
> +               "EventName": "float_store_inst",
> +               "BriefDescription": "Floating-point store instruction cou=
nt"
> +       },
> +       {
> +               "EventCode": "0x130",
> +               "EventName": "float_add_sub_inst",
> +               "BriefDescription": "Floating-point addition/subtraction =
instruction count"
> +       },
> +       {
> +               "EventCode": "0x140",
> +               "EventName": "float_mul_inst",
> +               "BriefDescription": "Floating-point multiplication instru=
ction count"
> +       },
> +       {
> +               "EventCode": "0x150",
> +               "EventName": "float_fused_muladd_inst",
> +               "BriefDescription": "Floating-point fused multiply-add in=
struction count"
> +       },
> +       {
> +               "EventCode": "0x160",
> +               "EventName": "float_div_sqrt_inst",
> +               "BriefDescription": "Floating-point division or square-ro=
ot instruction count"
> +       },
> +       {
> +               "EventCode": "0x170",
> +               "EventName": "other_float_inst",
> +               "BriefDescription": "Other floating-point instruction cou=
nt"
> +       },
> +       {
> +               "EventCode": "0x180",
> +               "EventName": "int_mul_add_sub_inst",
> +               "BriefDescription": "Integer multiplication and add/sub i=
nstruction count"
> +       },
> +       {
> +               "EventCode": "0x190",
> +               "EventName": "retired_ops",
> +               "BriefDescription": "Retired operation count"
> +       }
> +]
> diff --git a/tools/perf/pmu-events/arch/riscv/andes/ax45/memory.json b/to=
ols/perf/pmu-events/arch/riscv/andes/ax45/memory.json
> new file mode 100644
> index 000000000000..c7401b526c77
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/riscv/andes/ax45/memory.json
> @@ -0,0 +1,57 @@
> +[
> +       {
> +               "EventCode": "0x01",
> +               "EventName": "ilm_access",
> +               "BriefDescription": "ILM access"
> +       },
> +       {
> +               "EventCode": "0x11",
> +               "EventName": "dlm_access",
> +               "BriefDescription": "DLM access"
> +       },
> +       {
> +               "EventCode": "0x21",
> +               "EventName": "icache_access",
> +               "BriefDescription": "ICACHE access"
> +       },
> +       {
> +               "EventCode": "0x31",
> +               "EventName": "icache_miss",
> +               "BriefDescription": "ICACHE miss"
> +       },
> +       {
> +               "EventCode": "0x41",
> +               "EventName": "dcache_access",
> +               "BriefDescription": "DCACHE access"
> +       },
> +       {
> +               "EventCode": "0x51",
> +               "EventName": "dcache_miss",
> +               "BriefDescription": "DCACHE miss"
> +       },
> +       {
> +               "EventCode": "0x61",
> +               "EventName": "dcache_load_access",
> +               "BriefDescription": "DCACHE load access"
> +       },
> +       {
> +               "EventCode": "0x71",
> +               "EventName": "dcache_load_miss",
> +               "BriefDescription": "DCACHE load miss"
> +       },
> +       {
> +               "EventCode": "0x81",
> +               "EventName": "dcache_store_access",
> +               "BriefDescription": "DCACHE store access"
> +       },
> +       {
> +               "EventCode": "0x91",
> +               "EventName": "dcache_store_miss",
> +               "BriefDescription": "DCACHE store miss"
> +       },
> +       {
> +               "EventCode": "0xA1",
> +               "EventName": "dcache_wb",
> +               "BriefDescription": "DCACHE writeback"
> +       }
> +]
> diff --git a/tools/perf/pmu-events/arch/riscv/andes/ax45/microarch.json b=
/tools/perf/pmu-events/arch/riscv/andes/ax45/microarch.json
> new file mode 100644
> index 000000000000..a6d378cbaa74
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/riscv/andes/ax45/microarch.json
> @@ -0,0 +1,77 @@
> +[
> +       {
> +               "EventCode": "0xB1",
> +               "EventName": "cycle_wait_icache_fill",
> +               "BriefDescription": "Cycles waiting for ICACHE fill data"
> +       },
> +       {
> +               "EventCode": "0xC1",
> +               "EventName": "cycle_wait_dcache_fill",
> +               "BriefDescription": "Cycles waiting for DCACHE fill data"
> +       },
> +       {
> +               "EventCode": "0xD1",
> +               "EventName": "uncached_ifetch_from_bus",
> +               "BriefDescription": "Uncached ifetch data access from bus=
"
> +       },
> +       {
> +               "EventCode": "0xE1",
> +               "EventName": "uncached_load_from_bus",
> +               "BriefDescription": "Uncached load data access from bus"
> +       },
> +       {
> +               "EventCode": "0xF1",
> +               "EventName": "cycle_wait_uncached_ifetch",
> +               "BriefDescription": "Cycles waiting for uncached ifetch d=
ata from bus"
> +       },
> +       {
> +               "EventCode": "0x101",
> +               "EventName": "cycle_wait_uncached_load",
> +               "BriefDescription": "Cycles waiting for uncached load dat=
a from bus"
> +       },
> +       {
> +               "EventCode": "0x111",
> +               "EventName": "main_itlb_access",
> +               "BriefDescription": "Main ITLB access"
> +       },
> +       {
> +               "EventCode": "0x121",
> +               "EventName": "main_itlb_miss",
> +               "BriefDescription": "Main ITLB miss"
> +       },
> +       {
> +               "EventCode": "0x131",
> +               "EventName": "main_dtlb_access",
> +               "BriefDescription": "Main DTLB access"
> +       },
> +       {
> +               "EventCode": "0x141",
> +               "EventName": "main_dtlb_miss",
> +               "BriefDescription": "Main DTLB miss"
> +       },
> +       {
> +               "EventCode": "0x151",
> +               "EventName": "cycle_wait_itlb_fill",
> +               "BriefDescription": "Cycles waiting for Main ITLB fill da=
ta"
> +       },
> +       {
> +               "EventCode": "0x161",
> +               "EventName": "pipe_stall_cycle_dtlb_miss",
> +               "BriefDescription": "Pipeline stall cycles caused by Main=
 DTLB miss"
> +       },
> +       {
> +               "EventCode": "0x02",
> +               "EventName": "mispredict_condition_br",
> +               "BriefDescription": "Misprediction of conditional branche=
s"
> +       },
> +       {
> +               "EventCode": "0x12",
> +               "EventName": "mispredict_take_condition_br",
> +               "BriefDescription": "Misprediction of taken conditional b=
ranches"
> +       },
> +       {
> +               "EventCode": "0x22",
> +               "EventName": "mispredict_target_ret_inst",
> +               "BriefDescription": "Misprediction of targets of Return i=
nstructions"
> +       }
> +]
> diff --git a/tools/perf/pmu-events/arch/riscv/mapfile.csv b/tools/perf/pm=
u-events/arch/riscv/mapfile.csv
> index c61b3d6ef616..5bf09af14c1b 100644
> --- a/tools/perf/pmu-events/arch/riscv/mapfile.csv
> +++ b/tools/perf/pmu-events/arch/riscv/mapfile.csv
> @@ -15,3 +15,4 @@
>  #
>  #MVENDORID-MARCHID-MIMPID,Version,Filename,EventType
>  0x489-0x8000000000000007-0x[[:xdigit:]]+,v1,sifive/u74,core
> +0x31e-0x8000000000008a45-0x[[:xdigit:]]+,v1,andes/ax45,core
> --
> 2.34.1
>
>
